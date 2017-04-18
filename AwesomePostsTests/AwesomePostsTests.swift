//
//  AwesomePostsTests.swift
//  AwesomePostsTests
//
//  Created by Q Zhuang on 4/7/17.
//  Copyright © 2017 Q Zhuang. All rights reserved.
//

import XCTest
@testable import AwesomePosts

class AwesomePostsTests: XCTestCase {
    var viewModel: ApplicationViewModel!
    
    override func setUp() {
        super.setUp()

        let postsJson = "[{\"userId\":1,\"id\":1,\"title\":\"sunt aut facere repellat provident occaecati excepturi optio reprehenderit\",\"body\":\"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto\"}]"

        
        let usersJson = "[{\"id\":1,\"name\":\"Leanne Graham\",\"username\":\"Bret\",\"email\":\"Sincere@april.biz\",\"address\":{\"street\":\"Kulas Light\",\"suite\":\"Apt. 556\",\"city\":\"Gwenborough\",\"zipcode\":\"92998-3874\",\"geo\":{\"lat\":\"-37.3159\",\"lng\":\"81.1496\"}},\"phone\":\"1-770-736-8031 x56442\",\"website\":\"hildegard.org\",\"company\":{\"name\":\"Romaguera-Crona\",\"catchPhrase\":\"Multi-layered client-server neural-net\",\"bs\":\"harness real-time e-markets\"}}]"
        
        let commentsJson = "[{\"postId\":1,\"id\":1,\"name\":\"id labore ex et quam laborum\",\"email\":\"Eliseo@gardner.biz\",\"body\":\"laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium\"},{\"postId\":1,\"id\":2,\"name\":\"quo vero reiciendis velit similique earum\",\"email\":\"Jayne_Kuhic@sydney.com\",\"body\":\"est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et\"}]"
        
        viewModel = ApplicationViewModel.init(posts: postsJson, users: usersJson, comments: commentsJson)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFindUserById() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let userName = self.viewModel.userById(1)?.name
        XCTAssertEqual(userName!, "Leanne Graham")
    }
    
}
