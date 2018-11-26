
---
title: CommonLispでXML読み込み（CXML、XPATH）
tags: CommonLisp XML xpath
author: kedama17
slide: false
---

# CommonLispでXMLファイルを読み込みたい

読んでみました。
[Closure XML](https://common-lisp.net/project/cxml/)と[Plexippus XPath](https://common-lisp.net/project/plexippus-xpath/examples.html)を使用しています。

```cl:xmltest.lisp
; Closure XMLをロード
(ql:quickload :cxml)
(ql:quickload :cxml-stp)
; Plexippus XPathをロード
(ql:quickload :xpath)

(let (xml)
  ; XML読み込み
  (setf xml (cxml:parse-file "./test.xml" (stp:make-builder)))
  ; 文字列を取得
  (format t "string : ~A~%" (xpath:string-value (xpath:evaluate "/document/string" xml)))
  ; 数値を取得
  (format t "number : ~A~%" (xpath:number-value (xpath:evaluate "/document/number" xml)))
  ; 複数のノードを処理する
  (xpath:do-node-set
    (node (xpath:evaluate "/document/books/*" xml))
    (format t "book : name=>~A , price=>~A~%" 
            (xpath:string-value (xpath:evaluate "name" node))
            (xpath:string-value (xpath:evaluate "price" node)))))
```

```xml:test.xml
<?xml version="1.0"?>
<document>
  <string>foobar</string>
  <number>123</number>
  <books>
    <book>
      <name>foo</name>
      <price>1000</price>
    </book>
    <book>
      <name>bar</name>
      <price>500</price>
    </book>
  </books>
</document>
```

結果。

```shell-session
* (load "./xmltest.lisp")

;;; Checking for wide character support... WARNING: Lisp implementation doesn't use UTF-16, but accepts surrogate code points.
 yes, using code points.
To load "cxml":
  Load 1 ASDF system:
    cxml
; Loading "cxml"
;;; Checking for wide character support... WARNING: Lisp implementation doesn't use UTF-16, but accepts surrogate code points.
 yes, using code points.
;;; Building Closure with CHARACTER RUNES
.
To load "cxml-stp":
  Load 1 ASDF system:
    cxml-stp
; Loading "cxml-stp"
.......
To load "xpath":
  Load 1 ASDF system:
    xpath
; Loading "xpath"

string : foobar
number : 123
book : name=>foo , price=>1000
book : name=>bar , price=>500
T
*
```

xpath:boolean-valueの使い方はよくわかりませんでした。
