---
title: "Emacsのorg-modeで論文を書こう2025"
topics: [emacs, org, 論文]
emoji: 🖨️
type: tech
published: false
---

冬、それは論文の季節。

ここでは、Emacsのorg-modeで論文執筆の環境を作ります。この至高のエディタ[^1]で、研究室のメンバーに差をつけましょう。


## できるようになること

-   テキストからLaTeXへの変換: 論文における本文・表・図や引用を、Markdownに近い書き方で記述できるようになる
-   PDFプレビュー: `latexmk` を用いて、ファイルを保存するたびにPDFを出力できるようになる
-   文献の参照: 本文中で文献を参照すると、参考文献として記載される。また、文献を対話的に選択できるようになる

ざっくりいうと、 ****自前のエディタで、プレーンテキストで論文を書きつつ、Overleafに近いワークフローが実現できます。****


## org-modeで論文を書くメリット

org-modeとはEmacsモードの一つで、アウトライナー機能やタスク管理機能の集合体です。モードというのはVSCodeでいう拡張機能のようなもので、Emacsの設定ファイルに設定を記述することで利用します。org-modeには構造化ドキュメントを作成するための独自のマークアップ言語と、その言語で記述された文書をエクスポートする機能が含まれており、今回はこれを利用します[^2]。

org-modeで論文を書く一番のメリットは、本文に集中できるようになることです。LaTeXマクロの仔細に惑わされる事なく、執筆そのものに重点を置くことができます。

文章だけではわかりづらいと思うので、例を示します。「はじめに〜評価〜おわりに」という構成の論文を `org` ファイルで記述すると、

    #+LATEX_COMPILER: lualatex
    #+LATEX_CLASS: ltjsarticle
    #+LATEX_CLASS_OPTIONS: [twocolumn]
    #+BIBLIOGRAPHY: sample.bib
    #+CITE_EXPORT: natbib unsrtnat
    #+TITLE: Emacsのorg-modeで論文を書こう2025
    #+AUTHOR: gomadoufu, 唯野教授
    #+DATE: \today
    #+OPTIONS: toc:nil
    
    #+LATEX_HEADER_EXTRA: \usepackage{amsmath}
    #+LATEX_HEADER_EXTRA: \usepackage{graphicx}
    #+LATEX_HEADER_EXTRA: \usepackage{hyperref}
    #+LATEX_HEADER_EXTRA: \usepackage{url}
    #+LATEX_HEADER_EXTRA: \usepackage[numbers,sort,compress]{natbib}
    
    #+begin_abstract
    本稿では、Emacsのorg-modeを用いた論文執筆環境の構築方法について述べる。
    org-modeはプレーンテキストベースで構造化された文書を作成でき、LaTeXへのエクスポート機能により学術論文の執筆に適している。
    我々は、org-citeを用いた文献管理、自動PDF生成、ltjsarticleクラスとの統合方法を示す。
    提案手法により、Markdown的な記法で可読性の高いソースを保ちながら、高品質な論文PDFを生成できることを確認した。
    #+end_abstract
    
    * はじめに
    :PROPERTIES:
    :CUSTOM_ID: sec:introduction
    :END:
    
    学術論文の執筆において、LaTeX[cite:@latexproject]は標準的なツールとして広く利用されている。
    しかし、LaTeXの記法は冗長であり、文書の構造が見えにくいという課題がある。
    特に初学者にとっては、コマンドの羅列により本来の執筆作業に集中しづらい。
    
    一方、Markdown[cite:@markdown]に代表される軽量マークアップ言語は、シンプルな記法で構造化文書を記述できる。
    Emacs[cite:@gnuemacs]のorg-mode[cite:@orgmode]は、Markdown以上の表現力を持ちながら、LaTeXへのエクスポート機能を備えている。
    
    本稿では、org-modeを用いた論文執筆環境の構築方法を提案する。
    具体的には、以下の3点について述べる:
    
    1. org-citeによる文献管理の統合
    2. ltjsarticleクラスとの連携設定
    3. 自動PDF生成ワークフローの実装
    
    これにより、可読性の高いソースコードを維持しながら、学会投稿に適したPDFを生成できる。
    
    
    * 評価
    
    ** 執筆効率の比較
    
    提案手法と従来のLaTeX直接編集における執筆効率を比較した。
    被験者10名に、同一内容の2ページ程度の技術文書を作成してもらい、所要時間を計測した。
    
    表[[tab:efficiency]]に結果を示す。
    org-modeを用いた場合、平均で23%の時間短縮が見られた。
    
    #+NAME: tab:efficiency
    #+CAPTION: 執筆手法別の所要時間比較
    #+ATTR_LATEX: :environment tabular :placement [tb]
    | 手法          | 平均時間(分) | 標準偏差 |
    |---------------+--------------+----------|
    | LaTeX直接編集 |         45.3 |      8.2 |
    | org-mode      |         34.8 |      6.5 |
    
    ** 可読性の評価
    
    ソースコードの可読性について、被験者による主観評価を実施した。
    5段階評価(1:読みにくい、5:読みやすい)の結果、org-mode記法は平均4.2点、LaTeX記法は平均2.8点となった。
    
    * おわりに
    :PROPERTIES:
    :CUSTOM_ID: sec:conclusion
    :END:
    
    本稿では、Emacsのorg-modeを用いた論文執筆環境について述べた。
    org-citeによる文献管理、ltjsarticleクラスとの統合、自動PDF生成により、効率的な執筆環境を実現した。
    
    #+print_bibliography:

以下のPDFが完成します[^3]。 ![](https://github.com/gomadoufu/zenn-content/blob/main/how-to-write-papers-with-org-2025/1.png?raw=true)


## 必要なもの

-   Emacs
-   Tex Live


## OrgファイルをLaTeXファイルに変換する

最新のEmacsはorg-modeを標準搭載しており、さらにorg-modeはデフォルトでLaTeXエクスポート機能(`ox-latex`)を含んでいます。よって、Emacsをインストールした時点で、OrgファイルをLaTeXファイルに変換することはできます。しかし実用上、追加で以下のような機能が欲しくなりますね

-   エクスポート時に `latexmk` を利用する
-   論文投稿先の学会から提供されたクラスファイルを利用する

これらを実現するために、明示的な設定が必要です。

Emacsの設定ファイル `init.el` に以下を書きます。

```emacs-lisp
(use-package org-mode)
  
  ;;; LaTeX Export設定
(use-package ox-latex
  :ensure nil
  :demand t
  :after org
  :custom

  ;; org-latex-compilerは文字列ではなくnilにする（latexmk使用時）
  (org-latex-compiler nil)

  ;; latexmkを使用してPDF生成
  (org-latex-pdf-process
   '("latexmk -f %f"))

  :config
  ;; LuaLaTeX-ja用のクラス定義
  (add-to-list 'org-latex-classes
               '("ltjsarticle"
                 "\\documentclass{ltjsarticle}
                 [NO-DEFAULT-PACKAGES]
                 \\usepackage{hyperref}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
```

`org-latex-pdf-process` はデフォルトでは `pdflatex` を利用することになっていて、ここを書き換えることでエクスポート時に任意のコマンドを実行できます。今回はここで `latexmk` を呼び出すことで、LaTeX特有の環境設定を記述することを回避しています。一般的な場合と同様に、以下のような `latexmkrc` を `org` ファイルと同じディレクトリに置いてください。

```perl
#!/usr/bin/env perl

# $latex = 'platex -synctex=1 -halt-on-error -interaction=nonstopmode';
# $bibtex = 'pbibtex';  # platex用はpbibtex
# $dvipdf = 'dvipdfmx %O -o %D %S';
# $makeindex = 'mendex %O -o %D %S';
# $pdf_mode = 3;  # 3 = latex → dvi → pdf

# # uplatex + dvipdfmx
# $latex = 'uplatex -synctex=1 -halt-on-error -interaction=nonstopmode';
# $bibtex = 'upbibtex';
# $dvipdf = 'dvipdfmx %O -o %D %S';
# $makeindex = 'mendex %O -o %D %S';
# $pdf_mode = 3;

# lualatex
$lualatex = 'lualatex -synctex=1 -halt-on-error -interaction=nonstopmode';
$bibtex = 'upbibtex';  # または 'bibtex'
$makeindex = 'mendex %O -o %D %S';  # または 'makeindex'
$pdf_mode = 4;  # 4 = lualatex

# 外部PDFビューアを使わない（今回はEmacsで開くため、外部ビューワなどお好みで）
$pdf_previewer = 'none';
$preview_mode = 0;
```

また、上記のように `org-latex-classes` に文書クラスの定義を追加することで、デフォルトではサポートされていない日本語文書クラスに対応させています。もし投稿学会からテンプレートが配布されている場合は、クラスファイルを参照してクラス定義を作成し、このリストに追加することで、変換に使用できるようになります。

クラス定義中に `[NO-DEFAULT-PACKAGES]` を指定すると、org-modeが自動的に挿入するデフォルトパッケージが読み込まれなくなります。これは、文書クラスや学会テンプレートが独自のパッケージ構成を持っている場合に、競合を避けるために必要になります。特に日本語文書クラスでは `platex` や `uplatex` が使われていることが多いため、デフォルトパッケージとの噛み合わせが悪いので、設定しておいた方が無難です。後述しますが、パッケージの追加は `org` ファイル中で指定できます。


## PDFをプレビューする

論文を変更したら、PDFをプレビューして確認したいものです。

```emacs-lisp
(use-package spinner)

(use-package async)

(use-package org
  :bind
  ;; 非同期プレビュー
  ("C-c C-v p" . my/org-latex-preview-pdf)
  ;; 同期プレビュー
  ("C-c C-v s" . my/org-latex-export-sync)
  ;; コンパイル中断
  ("C-c C-v k" . my/org-latex-cancel-compile)

  :config
 ;; スピナー変数
  (defvar my/latex-spinner nil "LaTeXコンパイル用スピナー")
  (defvar my/latex-compile-buffer nil "コンパイル中のバッファ")
  
  (defvar my/latex-async-process nil)

  (defun my/org-latex-export-async (on-success)
    (when my/latex-spinner
      (message "⚠️  既にコンパイル中です")
      (cl-return-from my/org-latex-export-async))
    
    (setq my/latex-spinner (spinner-create 'progress-bar-filled t))
    (setq my/latex-compile-buffer (current-buffer))
    (spinner-start my/latex-spinner)
    (message "📄 PDF生成中（非同期）...")
    
    (let ((org-file buffer-file-name)
          (org-file-dir (file-name-directory buffer-file-name))
          (pdf-process org-latex-pdf-process)
          (latex-classes org-latex-classes)
          (latex-default-packages-alist org-latex-default-packages-alist))
      
      ;; プロセスオブジェクトを保存
      (setq my/latex-async-process
            (async-start
             `(lambda ()
                (require 'org)
                (require 'ox-latex)
                (setq org-latex-classes ',latex-classes)
                (setq org-latex-default-packages-alist ',latex-default-packages-alist)
                (setq org-latex-pdf-process ',pdf-process)
                (with-temp-buffer
                  (insert-file-contents ,org-file)
                  (setq buffer-file-name ,org-file)
                  (setq default-directory ,org-file-dir)
                  (org-mode)
                  (condition-case err
                      (let ((pdf-file (org-latex-export-to-pdf)))
                        (if pdf-file
                            (list 'success pdf-file)
                          (list 'error "PDF生成失敗")))
                    (error (list 'error (error-message-string err))))))
             
             (lambda (result)
               (when my/latex-spinner
                 (spinner-stop my/latex-spinner)
                 (setq my/latex-spinner nil))
               
               (cond
                ((eq (car result) 'success)
                 (let ((pdf-file (cadr result)))
                   (funcall on-success pdf-file)))
                ((eq (car result) 'error)
                 (message "❌ PDF生成エラー: %s" (cadr result)))
                (t
                 (message "❌ 不明なエラー")))
               
               (setq my/latex-compile-buffer nil)
               (setq my/latex-async-process nil))))))  

  ;; 自動エクスポート（保存時）
  (defun my/org-latex-export-auto ()
    (when (and (eq major-mode 'org-mode)
               (boundp 'my/auto-export-pdf)
               my/auto-export-pdf)
      (my/org-latex-export-async
       (lambda (pdf-file)
         (message "✅ PDF生成完了: %s" pdf-file)))))

  (add-hook 'after-save-hook #'my/org-latex-export-auto)

  ;; 手動プレビュー
  (defun my/org-latex-preview-pdf ()
    (interactive)
    (my/org-latex-export-async
     (lambda (pdf-file)
       (message "✅ PDF生成完了: %s" pdf-file)
       (find-file-other-window pdf-file))))
  
  ;; コンパイルをキャンセル
  (defun my/org-latex-cancel-compile ()
    "進行中のLaTeXコンパイルをキャンセル"
    (interactive)
    (when my/latex-spinner
      (spinner-stop my/latex-spinner)
      (setq my/latex-spinner nil))
    
    ;; バックグラウンドプロセスをkill
    (when (and my/latex-async-process
               (process-live-p my/latex-async-process))
      (delete-process my/latex-async-process)
      (message "🛑 コンパイルプロセスを強制終了しました"))
    
    (setq my/latex-async-process nil)
    (setq my/latex-compile-buffer nil)
    (message "⚠️  コンパイルをキャンセルしました"))
  
  
  ;; 同期的にPDF生成（デバッグ用）
  (defun my/org-latex-export-sync ()
    (interactive)
    (let ((spinner (spinner-create 'progress-bar-filled t)))
      (spinner-start spinner)
      (condition-case err
          (progn
            (message "📝 PDF生成中（同期）...")
            (redisplay t)
            (org-latex-export-to-pdf)
            (spinner-stop spinner)
            (message "✅ PDF生成完了"))
        (error
         (spinner-stop spinner)
         (message "❌ エラー: %s" (error-message-string err)))))))
```

上記の設定で、バックグラウンドで `latexmk` プロセスを走らせて、リアルタイムプレビューすることができます。 `async` パッケージを利用して非同期に処理を進めることで、コンパイル中もバッファの編集が可能です。なお、コンパイル中に保存した場合はコンパイル処理が2つになるわけではなく、後から来た処理がアーリーリターンします。また、もしコンパイル中に問題が起きて処理がハングしてしまった場合、キャンセル関数を呼び出すことで処理を中止できます。 ![](https://github.com/gomadoufu/zenn-content/blob/main/how-to-write-papers-with-org-2025/2.png?raw=true)


## Orgファイルの書き方

`org` ファイルで論文を執筆し、原稿をプレビューすることができるようになりました。ここでOrgファイルでの論文の書き方を説明します。なお、必要最低限かつざっくり説明なので、他にも色々機能はあるはずです


### コンパイラ・文書クラス

    #+LATEX_COMPILER: lualatex
    #+LATEX_CLASS: ltjsarticle
    #+LATEX_CLASS_OPTIONS: [twocolumn]

コンパイラ、文書クラスなど、最低限の設定には専用のディレクティブがあります。これについては、TeXの変換結果をみてもらった方が理解が早いですね

```tex
% Created 2025-12-04 Thu 22:07
% Intended LaTeX compiler: lualatex
\documentclass[twocolumn]{ltjsarticle}
```

たとえば学会のテンプレートを使っていて、論文誌と研究報告を切り替えるトグルがある場合は、この角かっこの中に記述すればいいわけです。


### パッケージ

`\usepackage` 相当の記述をしたいときは、以下のように書きます

    #+LATEX_HEADER_EXTRA: \usepackage{amsmath}
    #+LATEX_HEADER_EXTRA: \usepackage{graphicx}
    #+LATEX_HEADER_EXTRA: \usepackage{hyperref}
    #+LATEX_HEADER_EXTRA: \usepackage{url}

ちょっと不恰好ですね、、その代わりLaTeXが見たまんま出るので、 `\newcommand` などもこちらで。


### タイトル・著者情報など

専用のディレクティブがいくつかあります[^4]。

    #+TITLE: Emacsのorg-modeで論文を書こう2025
    #+AUTHOR: gomadoufu, 唯野教授
    #+DATE: \today
    #+OPTIONS: toc:nil

学会に出す場合は、タイトルや著者情報には専用のコマンドが用意されていることも多いです。そのような時は上記 `OPTIONS` でそれらを `nil` にした上で、org-mode内の `latex` ソースブロックで部分的にLaTeXを書いて対応します。

例えば情報処理学会の公式テンプレートを使用する場合、 `\usepackage` を除いたファイル冒頭はこのようになります。 `#+begin_export latex` と `#+end_export` で囲まれた箇所が、LaTeXでそのまま出力される[^5]ので、必ず所定の形式で出力されます。

    #+LATEX_COMPILER: platex
    #+LATEX_CLASS: ipsj
    #+LATEX_CLASS_OPTIONS: [submit,techrep,noauthor]
    #+OPTIONS: toc:nil author:nil date:nil
    
    #+LATEX_HEADER_EXTRA: \usepackage{otf}
    #+LATEX_HEADER_EXTRA: \usepackage{amsmath}
    #+LATEX_HEADER_EXTRA: \usepackage[dvipdfmx]{graphicx}
    #+LATEX_HEADER_EXTRA: \usepackage[dvipdfmx]{hyperref}
    ...(略)
    
    #+begin_export latex
    \title{Emacsのorg-modeで論文を書こう2025}
    
    \affiliate{University X}{university.example}
    \author{gomadoufu}{gomadoufu}{University X}[user@university.example]
    \author{唯野教授}{tadano kyozyu}{University X}[professor@university.example]
    #+end_export
    
    #+begin_export latex
    \begin{abstract}
    本稿では、Emacsのorg-modeを用いた論文執筆環境の構築方法について述べる。
    org-modeはプレーンテキストベースで構造化された文書を作成でき、LaTeXへのエクスポート機能により学術論文の執筆に適している。
    我々は、org-citeを用いた文献管理、自動PDF生成、IPSJテンプレートとの統合方法を示す。
    提案手法により、Markdown的な記法で可読性の高いソースを保ちながら、高品質な論文PDFを生成できることを確認した。
    \end{abstract}
    #+end_export
    
    #+begin_export latex
    \begin{jkeyword}
    Emacs, org-mode, LaTeX, 論文執筆
    \end{jkeyword}
    #+end_export

ここまでで `org` ファイルを、クラスファイルに沿った形でPDFにすることができるようになりました。


## 参照・参考文献のコントロール

最後に、図表を本文中で参照したり、論文に参考文献を記載できるようにします。


### 図表の参照

図表の参照にはRefTeX[^6]を利用します。文中でorg-modeのリンク記法を使って、図表との相互参照を作ることができます。

`init.el` に、以下のように設定します

```emacs-lisp
(use-package reftex
  :ensure nil
  :hook
  (org-mode . reftex-mode)
  (LaTeX-mode . reftex-mode)
  
  :custom
  ;; RefTeXとorg-modeの統合
  (reftex-plug-into-AUCTeX t)
  (reftex-default-bibliography '("~/Documents/references.bib"))
  
  ;; ラベルの接頭辞設定
  (reftex-label-alist
   '(("\\section" ?s "sec:" "~\\ref{%s}" t ("section" "Section"))
     ("\\subsection" ?u "subsec:" "~\\ref{%s}" t ("subsection" "Subsection"))
     ("\\subsubsection" ?b "subsubsec:" "~\\ref{%s}" t ("subsubsection"))
     ("\\equation" ?e "eq:" "~\\eqref{%s}" t ("equation" "Equation"))
     ("\\figure" ?f "fig:" "~\\ref{%s}" t ("figure" "Figure"))
     ("\\table" ?t "tab:" "~\\ref{%s}" t ("table" "Table"))))
  
  ;; 目次の設定
  (reftex-toc-split-windows-horizontally t)
  (reftex-toc-split-windows-fraction 0.3))
```

本文中で、このように利用します

    この提案手法全体の概要図を図[[fig:sys-overview]]に示す.
    
    #+NAME: fig:sys-overview
    #+CAPTION: 提案手法の概要図
    #+ATTR_LATEX: :scale 0.15 :options bb=0 0 2000 1000 :placement [tb]
    [[file:image/system.drawio.png]]
    
    表[[tab:efficiency]]に結果を示す。
    org-modeを用いた場合、平均で23%の時間短縮が見られた。
    
    #+NAME: tab:efficiency
    #+CAPTION: 執筆手法別の所要時間比較
    #+ATTR_LATEX: :environment tabular :placement [tb]
    | 手法 | 平均時間（分） | 標準偏差 |
    |------+----------------+----------|
    | LaTeX直接編集 | 45.3 | 8.2 |
    | org-mode | 34.8 | 6.5 |


### 参考文献の参照

org-modeにはデフォルトでorg-cite[^7]という機能があり、文中に `[cite:@key]` と書くことでLaTeXでいうところの `\cite` 形式の参照が利用できるほか、 `bib` ファイルからの文献の検索と挿入が可能になります。これにフロントエンドとしてcitar[^8]パッケージを組み合わせることで、リアルタイムな絞り込み検索ができます。快適。

```emacs-lisp
;;; org-cite設定
(use-package oc
  :ensure nil)

;;; citar設定（org-citeのUI強化）
(use-package citar
  :custom
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  :bind
  (:map org-mode-map
        ("C-c b" . citar-insert-citation)))
```

上記の設定をしたら、~org~ ファイルの冒頭に以下の内容を加えます

    #+BIBLIOGRAPHY: sample.bib
    #+CITE_EXPORT: natbib unsrtnat

bibファイル名および使用する文献管理ツールは、適宜調整してください。特記すべきは `CITE_EXPORT` で、ここにbstファイルを指定することができます。情報処理学会なら、このように

    #+CITE_EXPORT: natbib ipsjunsrt

さて、ここまで設定したら、 `bib` ファイルを用意した上で、文献を参照したい箇所で `C-c b` と打ちます。すると、ミニバッファで文献を対話的に選択して、 `[cite:@key]` を文中に挿入することができるようになります。 ![](https://github.com/gomadoufu/zenn-content/blob/main/how-to-write-papers-with-org-2025/3.gif?raw=true)

最後に、論文の末尾で

    #+print_bibliography:

と書くと、参考文献リストが自動で出力されます。

参照や参考文献も `org` ファイル全体は[BROKEN LINK: org-modeで論文を書くメリット]をご覧ください。


## おわりに

なんか記事がめちゃくちゃ長くなっちゃいました！！！！！ Emacsで良い論文執筆ライフを！[^9]


## 参考


[^1]: 著者が行ったアンケートの結果による.(n=1)
[^2]: <https://takaxp.github.io/org-ja.html#Top>
[^3]: orgファイルからtexファイルへの変換はorg-modeによるものですが、組版のステップはTex環境およびlatexmkによるものです。よってこのステップに限れば、Emacsでなくとも実現できます。
[^4]: <https://orgmode.org/manual/Export-Settings.html>
[^5]: orgファイルの中にLaTeXがそのまま書けることは大きなメリットです。普段は簡便な記法を使いつつも、不測の事態に遭遇したらLaTeXにフォールバックして、インターネットにある解決策を適用できます。
[^6]: <https://www.gnu.org/software/auctex/reftex.html>
[^7]: abc
[^8]: abc
[^9]: 論文執筆には、Emacsの他に、健康が必要です。寒いので体調にお気をつけて〜
