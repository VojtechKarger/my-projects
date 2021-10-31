//
//  CodingGameTests.swift
//  CodingGameTests
//
//  Created by vojta on 18.09.2021.
//

import XCTest
@testable import CodingGame

class CodingGameTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let str = "if you are clever and ifaslkfjdaů ahoj if cus if"
        let ranges = str.foundRangesOfWord("if")
        print(ranges)
        XCTAssert(!ranges.isEmpty, "test succesfully failed")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
            let str = "if you are clever and if aslkfjdaů ahoj if cus if aůfkdaflk fadksjfasd fnds fds f dsf sd f  sdfsdfsdf sdfsfkjdsflasdkjfasd fsdakfjdnsakf sadfdskjfnsdkf sfdkjdfklaf adkjsfnksf  ajdsfaklsdf akdfjnaksjdfnka vfakjnfjka dfandfldaůfkjndaskf dsjfnlskaůnflkansdůf dsfkndkfnlaf if asodkfnůlsdknfsa adnflaksdnf asdlkfnalksdnfif you are clever and if aslkfjdaů ahoj if cus if aůfkdaflk fadksjfasd fnds fds f dsf sd f  sdfsdfsdf sdfsfkjdsflasdkjfasd fsdakfjdnsakf sadfdskjfnsdkf sfdkjdfklaf adkjsfnksf  ajdsfaklsdf akdfjnaksjdfnka vfakjnfjka dfandfldaůfkjndaskf dsjfnlskaůnflkansdůf dsfkndkfnlaf if asodkfnůlsdknfsa adnflaksdnf asdlkfnalksdnfif you are clever and if aslkfjdaů ahoj if cus if aůfkdaflk fadksjfasd fnds fds f dsf sd f  sdfsdfsdf sdfsfkjdsflasdkjfasd fsdakfjdnsakf sadfdskjfnsdkf sfdkjdfklaf adkjsfnksf  ajdsfaklsdf akdfjnaksjdfnka vfakjnfjka dfandfldaůfkjndaskf dsjfnlskaůnflkansdůf dsfkndkfnlaf if asodkfnůlsdknfsa adnflaksdnf asdlkfnalksdnfif you are clever and if aslkfjdaů ahoj if cus if aůfkdaflk fadksjfasd fnds fds f dsf sd f  sdfsdfsdf sdfsfkjdsflasdkjfasd fsdakfjdnsakf sadfdskjfnsdkf sfdkjdfklaf adkjsfnksf  ajdsfaklsdf akdfjnaksjdfnka vfakjnfjka dfandfldaůfkjndaskf dsjfnlskaůnflkansdůf dsfkndkfnlaf if asodkfnůlsdknfsa adnflaksdnf asdlkfnalksdnfif you are clever and if aslkfjdaů ahoj if cus if aůfkdaflk fadksjfasd fnds fds f dsf sd f  sdfsdfsdf sdfsfkjdsflasdkjfasd fsdakfjdnsakf sadfdskjfnsdkf sfdkjdfklaf adkjsfnksf  ajdsfaklsdf akdfjnaksjdfnka vfakjnfjka dfandfldaůfkjndaskf dsjfnlskaůnflkansdůf dsfkndkfnlaf if asodkfnůlsdknfsa adnflaksdnf asdlkfnalksdnfif you are clever and if aslkfjdaů ahoj if cus if aůfkdaflk fadksjfasd fnds fds f dsf sd f  sdfsdfsdf sdfsfkjdsflasdkjfasd fsdakfjdnsakf sadfdskjfnsdkf sfdkjdfklaf adkjsfnksf  ajdsfaklsdf akdfjnaksjdfnka vfakjnfjka dfandfldaůfkjndaskf dsjfnlskaůnflkansdůf dsfkndkfnlaf if asodkfnůlsdknfsa adnflaksdnf asdlkfnalksdnfif you are clever and if aslkfjdaů ahoj if cus if aůfkdaflk fadksjfasd fnds fds f dsf sd f  sdfsdfsdf sdfsfkjdsflasdkjfasd fsdakfjdnsakf sadfdskjfnsdkf sfdkjdfklaf adkjsfnksf  ajdsfaklsdf akdfjnaksjdfnka vfakjnfjka dfandfldaůfkjndaskf dsjfnlskaůnflkansdůf dsfkndkfnlaf if asodkfnůlsdknfsa adnflaksdnf asdlkfnalksdnf"
            print(str.colorTextInRanges(attributes: ["if":.red,"else":.green,"ahoj":.systemBlue]))
        }
    }

}
