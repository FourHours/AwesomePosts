//
//  ApplicationViewModel.swift
//  AwesomePosts
//
//  Created by Q Zhuang on 4/7/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import PromiseKit
import ObjectMapper
import ReactiveCocoa
import ReactiveSwift
import Static
import MagicalRecord

class ApplicationViewModel {
    let posts = MutableProperty<[Post]>([Post]())
    let users = MutableProperty<[User]>([User]())
    let comments = MutableProperty<[Comment]>([Comment]())
    
    let isLoading = MutableProperty<Bool>(false)
    let error = MutableProperty<Error?>(.none)
    
    init() {
        
    }
    
    //For Unit Tests
    init(posts: String, users: String, comments: String) {        
        if let list = Mapper<Post>().mapArray(JSONString: posts) {
            self.posts.value = list
        }
        
        if let list = Mapper<User>().mapArray(JSONString: users) {
            self.users.value = list
        }
        
        if let list = Mapper<Comment>().mapArray(JSONString: comments) {
            self.comments.value = list
        }

    }
}

extension ApplicationViewModel {
    
    // MARK: - Entry
    func fetchPosts() {
        self.isLoading.value = true
        
        Resource<Post>(url: Configuration.postUrl)
            .start()
            .then { list -> Void in
                self.posts.value = list
            }
            .then {
                return Resource<User>(url: Configuration.usersUrl).fetch()
            }
            .then { list -> Void in
                self.users.value = list
            }
            .then {
                return Resource<Comment>(url: Configuration.commentsUrl).fetch()
            }
            .then { list -> Void in
                self.comments.value = list
            }
            .then {
                self.savePosts()
            }
            .always {
                self.isLoading.value = false
            }
            .catch { error in
                self.isLoading.value = false

                if let posts = self.loadPosts(),
                    posts.count > 0 {

                    self.posts.value = posts
                    self.comments.value = [Comment]()
                    self.users.value = [User]()
                }
                else {
                    self.error.value = error
                }
            }
    }
    
    // MARK: - TableView DataSources
    func postsTableSections(selection:@escaping (Post) -> Void) -> [Section]? {
        let postRows = self.posts.value.map{ (post) -> Row in
            return Row(text: post.title,
                       selection: { value in
                            selection(post)
                        },
                       cellClass: PostTableViewCell.self)
            }
        return [Section(rows: postRows)]
    }
    
    func postDetailTableSectionsByPostId(_ postId: Int) -> [Section]? {
        guard   let user = self.userById(postId) ,
                let comments = self.commentsByPostId(postId),
                let post = self.postById(postId)
        else { return .none }

        let userRows = user.toJSON().map { (key, value) -> Row in
            return Row(text: key.capitalized + ":", detailText: String(describing: value), cellClass: Value1Cell.self)
        }
        
        let commentRows = comments.map{ Row(text: $0.body, cellClass: PostTableViewCell.self) }
        let commentsHeader = "Comments (\(commentRows.count))"
        
        return [
            Section(header: "Author", rows: userRows),
            Section(header: "Description", rows: [
                Row(text: post.title, cellClass: PostTableViewCell.self)
                ]),
            Section(header: Section.Extremity.title(commentsHeader), rows: commentRows)
        ]

    }
    
    // MARK: - Helpers
    func userById(_ userId: Int?) -> User? {
        return self.users.value.filter{ $0.userId == userId }.first
    }
    
    func commentsByPostId(_ postId: Int?) -> [Comment]? {
        return self.comments.value.filter{ $0.postId == postId }
    }
    
    func postById(_ postId: Int?) -> Post? {
        guard let postId = postId else {
            return .none
        }
        return self.posts.value.filter({ $0.postId == postId }).first
    }
    
    // MARK: - Persistent
    func savePosts() { //On Background Thread
        for post in self.posts.value {
            post.save()
        }
    }
    
    func loadPosts() -> [Post]?{
        guard let managedPosts = PostCoreData.mr_findAll() else {
            return .none
        }
        return managedPosts.map({ (managedPost) -> Post in
            var post = Post()
            post.load(managedObject: managedPost)
            return post
        })
    }
}

