import React, { useState } from "react";
import { HashRouter, Route, Link, Switch } from "react-router-dom";
import { Document, Page, pdfjs } from "react-pdf";

pdfjs.GlobalWorkerOptions.workerSrc = `//cdnjs.cloudflare.com/ajax/libs/pdf.js/${pdfjs.version}/pdf.worker.js`;

const Header = () => {
  return (
    <section className="hero is-medium has-background-grey-dark">
      <div className="hero-body">
        <div className="container">
          <h1 className="title has-text-white-ter">早く逃げて捕まえて</h1>
          <h2 className="subtitle has-text-grey">team6</h2>
        </div>
      </div>
    </section>
  );
};

const SelectBar = () => {
  return (
    <nav className="breadcrumb" aria-label="breadcrumbs">
      <ul>
        <li>
          <Link to="/">作成者</Link>
        </li>
        <li>
          <Link to="/detailsgame">ゲームの説明</Link>
        </li>
        <li>
          <Link to="/rpg">レポート・GithubへのLink・ポスター</Link>
        </li>
      </ul>
    </nav>
  );
};

const TeamMember = () => {
  return (
    <div className="container">
      <h1 className="title">作成者</h1>
      <div className="content">
        <ul>
          <li>木村悠児</li>
          <li>高田楓我</li>
          <li>畑佐有輝</li>
        </ul>
      </div>
    </div>
  );
};

const RPG = () => {
  return (
    <div className="container">
      <h1 className="title">レポート・GithubへのLink・ポスター</h1>
      <div className="content">
        <ul>
          <li>
            <a href="https://drive.google.com/file/d/1VrWTPNvnuOIKnZtSVnqDIq7O6qWwe1dV/view?usp=sharing" target="_blank">最終レポート</a>
          </li>
          <li>
            <a href="https://github.com/yk-hts/dc-team6" target="_blank">ゲームのダウンロード</a>
          </li>
          <li>
            <a href="https://drive.google.com/file/d/1gCUNS7Jd2GjmRfhx8Axq6P0lz1Vfajm8/view?usp=sharing" target="_blank">ポスター</a>
          </li>
        </ul>
      </div>
    </div>
  );
};

const DetailsGame = () => {
  return (
    <div>
      <div className="container">
        <h1 className="title">ゲームの説明</h1>
        <p>このゲームは3つのモードで遊ぶことができます。</p>
      </div>
      <div className="container">
        <div className="section">
          <h2 className="is-size-5">1つ目のゲーム</h2>
          <p>
            画面にボールでてきて番号の小さい順にクリックしていき制限時間内にクリアを目指すゲームです。levelが3つに分かれていてそれぞれボールの数が10,20,30制限時間が15秒,30秒,45秒となります。この制限時間内にすべてのボールを順番でクリックすることが目標となります。制限時間をオーバーしてしまうとき以外にも5回連続で順番とは違う番号のボールをクリックしてしまったときもゲームオーバーとなります。
          </p>
          <a href="https://drive.google.com/file/d/1crRKwyJTOvxbU8aS07Fl-PAnCKdFkL1B/view?usp=sharing" target="_blank">仕様書へのリンク</a>
        </div>
      </div>
      <div className="section">
        <h2 className="is-size-5">2つ目のゲーム</h2> 
        <p>
          クリックするとランダムな方向に動いていくボールがあります。そのまま何もしないと画面の外にボールが出ていってしまうのでボールをクリックし別の方向に動かせることで画面の外にでることを防ぐゲームです。三段階のレベルがありレベル2が1に比べてボールの動く速度が早くなっていて、レベル3ではボールの数が2つになります。
        </p>
        <a href="https://drive.google.com/file/d/11ZaAPr1-1u1vaX-Yss1q8dREk85OBrtY/view?usp=sharing" target="_blank">仕様書へのリンク</a>
      </div>
      <div className="section">
        <h2 className="is-size-5">3つ目のゲーム</h2>
        <p>
          左側にあるボールはクリックをすることでジャンプをしますこのジャンプは二段ジャンプまでできるようになっています、画面の右側から障害物が出て迫ってくるのでそれをよけていきハイスコアを目指していくというゲームです。レベルが二段階かわるようになっていて障害物が迫ってくる速度が早くなります
        </p>
        <a href="https://drive.google.com/file/d/1f7I5W9B-ReRiGOI9ERLX82y3R5QogE0J/view?usp=sharing" target="_blank">仕様書へのリンク</a>
      </div>
    </div>
  );
};

const App = () => {
  return (
    <div>
      <HashRouter>
        <Header />
        <div className="section">
          <div className="container">
            <SelectBar />
            <Switch>
              <Route path="/" exact component={TeamMember} />
              <Route path="/detailsgame" component={DetailsGame} />
              <Route path="/rpg" component={RPG} />
            </Switch>
          </div>
        </div>
      </HashRouter>
    </div>
  );
};

export default App;
