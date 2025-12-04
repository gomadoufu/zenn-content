---
title: "(メモ)ox-zennの使い方"
topics: [emacs, orgmode, zenn]
emoji: 📝
type: tech
published: false
published_at: 2050-0612 09:03
---



## 使い方


### 基本的な記事の構造

記事の冒頭に以下のようなメタデータを設定します:

-   `#+ZENN_SLUG:` 記事のスラッグ（URL）
-   `#+ZENN_TYPE:` `tech` または `idea`
-   `#+ZENN_TOPICS:` トピック（スペース区切り）
-   `#+ZENN_PUBLISHED:` `true` または `false`


## 見出し

org-modeでは `*` の数で見出しレベルを表現します。


## 見出し1


### 見出し2

1.  見出し3

    1.  見出し4


## リスト

org-modeでは `-` または `+` でリストを作成します。


### 番号なしリスト

-   Hello!
-   Hola!
-   Bonjour!
    -   ネストされたアイテム
    -   別のネストアイテム


### 番号付きリスト

1.  First
2.  Second
3.  Third


## テキストリンク

org-modeでは二重角括弧でリンクを表現します。

[アンカーテキスト](https://zenn.dev)

または

<https://zenn.dev>


## 画像

org-modeでは `file:` プレフィックスで画像を指定します。

![](https://example.com/image.png)


### 画像の横幅を指定する

![](https://example.com/image.png =250x)


### Altテキストを指定する

org-exportでは自動的に画像ファイル名がaltになりますが、 カスタム設定で制御可能です。


### キャプションをつける

![](https://example.com/image.png)


### 画像にリンクを貼る

[[file:https://example.com/image.png](https://example.com)]


## テーブル

org-modeのテーブルは自動整形されます。

| Head | Head | Head |
| ---- | ---- | ---- |
| Text | Text | Text |
| Text | Text | Text |


## コードブロック

org-modeでは `#+begin_src` ブロックを使用します。


### 基本的なコードブロック

```js
const great = () => {
  console.log("Awesome");
};
```


### ファイル名を表示する（tangleオプションを使用）

```js
const great = () => {
  console.log("Awesome");
};
```


### diff表示

```diff
@@ -4,6 +4,5 @@
+ const foo = bar.baz([1, 2, 3]) + 1;
- let foo = bar.baz([1, 2, 3]);
```

言語とdiffを組み合わせる場合はカスタムエクスポート設定が必要です。


## 数式

org-modeはLaTeX数式をネイティブサポートしています。


### 数式のブロック

\begin{equation}
e^{i\theta} = \cos\theta + i\sin\theta
\end{equation}

または

\[ e^{i\theta} = \cos\theta + i\sin\theta \]


### インラインで数式を挿入する

インライン数式は $a\ne0$ のように記述します。


## 引用

org-modeでは `#+begin_quote` ブロックを使用します。

> 引用文 引用文


## 脚注

org-modeの脚注記法です。

脚注の例[^1]です。インライン[^2]で書くこともできます。


## 区切り線

org-modeでは5つ以上のダッシュで区切り線になります。

---


## インラインスタイル

org-modeのインライン記法です。

*イタリック* **太字** ~~打ち消し線~~ `code` または `code`


### 実際の表示例

-   *イタリック*
-   **太字**
-   ~~打ち消し線~~
-   インラインで `code` を挿入する


## インラインのコメント

org-modeでは `#` で始まる行がコメントになります。

このコメントはエクスポート時に非表示になります。


## Mermaid図

org-modeでもmermaidコードブロックが使用できます。 （HTMLエクスポート時に適切なJavaScriptライブラリが必要）


## 補足: org-modeで直接置き換えが難しい記法

以下の記法はorg-modeの標準機能では直接置き換えできず、 カスタムエクスポート設定やマクロが必要です：

-   メッセージブロック (:::message)
-   アコーディオン (:::details)
-   リンクカード (@[card])
-   各種埋め込み（Twitter, YouTube, GitHub等）
-   コードブロックのファイル名とdiffの同時表示

-&#x2014;

:::message
メッセージをここに
:::

:::message alert
メッセージをここに
:::

:::details タイトル
表示したい内容
:::

@[tweet](https://x.com/terminaldotshop/status/1995932448925114797?s=20) @[youtube](jNa3axo40qM) @[codepen](https://codepen.io/alphardex/pen/poyOMgr) @[slideshare](866aBtwVYswXvu) @[speakerdeck](3491c9ab20ef40938119aecadb06f1c6) @[jsfiddle](https://jsfiddle.net/chrisvfritz/50wL7mdz)

画像 ![](https://raw.githubusercontent.com/conao3/files/master/blob/headers/png/ox-zenn.el.png)

![image](https://raw.githubusercontent.com/conao3/files/master/blob/headers/png/ox-zenn.el.png)

![image](https://raw.githubusercontent.com/conao3/files/master/blob/headers/png/ox-zenn.el.png =250x)


[^1]: 脚注の内容その1
[^2]: 脚注の内容その2
