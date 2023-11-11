<template>
  <v-app class="">
    <home-app-bar
      :img-height="imgHeight"
    />

    <v-img
      id="scroll-top"
      dark
      src="https://picsum.photos/id/4/1920/1080"
      gradient="to top right, rgba(19,84,122,.6), rgba(128,208,199,.9)"
      :height="imgHeight"
    >
      <v-row
        align="center"
        justify="center"
        :style="{ height: `${imgHeight}px` }"
      >
        <v-col cols="12" class="text-center">
          <h1 class="display-1 mb-4">
            『Mail Mentor』で、ビジネス英語メールの習得を始めましょう!
          </h1>
        </v-col>
      </v-row>
    </v-img>

      <v-sheet>
        <section class="about">
          <div>
            <h1 class="heading-large mb-4">
              Mail Mentorとは
            </h1>
            <p>実践的なビジネス英語メールのスキルを<br>
              身につけるための初心者向けアプリです。
            </p>
          </div>
        </section>
        <section class="contents1">
          <div class="contents_inner1">
            <div class="menu">
              <v-row>
                <v-col cols="12" md="6" lg="6" class="flex-container-vertical">
                  <h1 class="heading-large">
                    英語の並び替え問題
                  </h1>
                  <p>ゲーム感覚で学び、ビジネスメール英語の感覚を磨きます。</p>
                </v-col>
                <v-col cols="12" md="6" lg="6" class="flex-container">
                  <img src="~assets/images/landing/並び替え問題.png" alt="画像1" class="image">
                </v-col>
              </v-row>
            </div>
          </div>
        </section>
        <section class="contents2">
          <div class="contents_inner2">
            <div class="menu">
              <v-row>
                <v-col cols="12" md="6" lg="6" class="flex-container">
                  <img src="~assets/images/landing/基礎チェック問題.png" alt="画像2" class="image">
                </v-col>
                <v-col cols="12" md="6" lg="6" class="flex-container-vertical">
                  <h1 class="heading-large">
                    ビジネスメールの基礎
                  </h1>
                  <p>実際のビジネスシーンで使える、基本的なビジネスメールの書き方を学びます。</p>
                </v-col>
              </v-row>
            </div>
          </div>
        </section>
        <section class="contents3">
          <div class="contents_inner3">
            <div class="menu">
              <v-row>
                <v-col cols="12" md="6" lg="6" class="flex-container-vertical">
                  <h1 class="heading-large">
                    学習進捗管理
                  </h1>
                  <p>クリアした問題の達成状況を一目で確認できます。</p>
                </v-col>
                <v-col cols="12" md="6" lg="6" class="flex-container">
                  <img src="~assets/images/landing/学習状況.png" alt="画像3" class="image">
                </v-col>
              </v-row>
            </div>
          </div>
        </section>
        <!-- <section class="contents4">
          <div class="contents_inner4">
            <div class="menu">
              <h2 class="justify-center display-1">
                投稿機能
              </h2>
            </div>
          </div>
        </section> -->
      </v-sheet>
    <app-footer />
  </v-app>
</template>

<script>
export default {

  data () {
    return {
      colors: ['primary', 'info', 'success', 'warning', 'error', 'background'],
      customClass: [
        { name: 'hidden-ipad-and-down', color: 'error', des: 'ipad未満で隠す' },
        { name: 'hidden-ipad-and-up', color: 'info', des: 'ipad以上で隠す' },
        { name: 'hidden-mobile-and-down', color: 'success', des: 'mobile未満で隠す' },
        { name: 'hidden-mobile-and-up', color: 'warning', des: 'mobile以上で隠す' }
      ],
      imgHeight: 500
    }
  }
}
</script>

<style>
.heading-large{
  font-size: 2.3em;
}
/* 黒三角 */
.about {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  margin: 3% 0 0 0;
  position: relative;
  text-align: center;
}
.about:before {
  content: '';
  position: absolute;
  left: 50%;
  bottom: -60px; /* 三角形の底辺がセクションの外に出るように設定 */
  border-left: 100px solid transparent; /* 左の斜辺 */
  border-right: 100px solid transparent; /* 右の斜辺 */
  border-top: 50px solid #000; /* 上向きの逆三角形なので、底辺はborder-topになる */
  transform: translateX(-50%); /* 中心に配置するために左に50%移動 */
  z-index: 1;
}

.small-text {
  font-size: 0.5em;
}

.menu {
  position: relative;
  z-index: 3;
}
/* インナーコンテンツ要素共通 */
.flex-container-vertical {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.flex-container {
  display: flex;
  justify-content: center;
  align-items: center;
}

.flex-container .image {
  margin: 0 auto;
  width: auto;
  height: 300px;
}
/* コンテンツ1 */
.contents1 {
  position: relative;
  overflow: hidden;
  margin: 55px 0;
}

.contents1:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 120%;
  height: 80%;
  margin: 0% -10% 0;
  background: #eae8e8;
  -webkit-transform-origin: left center;
  -ms-transform-origin: left center;
  transform-origin: left center;
  -webkit-transform: rotate(3deg);
  -ms-transform: rotate(3deg);
  transform: rotate(3deg);
  z-index: 2;

}
.contents1:after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 120%;
  height: 80%;
  margin: 0% -10% 0;
  background: #faff96;
  -webkit-transform-origin: right center;
  -ms-transform-origin: right center;
  transform-origin: right center;
  -webkit-transform: rotate(-3deg);
  -ms-transform: rotate(-3deg);
  transform: rotate(-3deg);
  z-index: 1;
}

.contents_inner1 {
  padding: 100px 100px 100px;
}
/* コンテンツ2 */
.contents2 {
  position: relative;
  overflow: hidden;
  margin: 55px 0;
}
.contents2:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 120%;
  height: 80%;
  margin: 0% -10% 0;
  background: #eae8e8;
  -webkit-transform-origin: left center;
  -ms-transform-origin: left center;
  transform-origin: left center;
  -webkit-transform: rotate(3deg);
  -ms-transform: rotate(3deg);
  transform: rotate(3deg);
  z-index: 2;
}

.contents2:after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 120%;
  height: 80%;
  margin: 0% -10% 0;
  background: #faff96;
  -webkit-transform-origin: right center;
  -ms-transform-origin: right center;
  transform-origin: right center;
  -webkit-transform: rotate(-3deg);
  -ms-transform: rotate(-3deg);
  transform: rotate(-3deg);
  z-index: 1;
}

.contents_inner2 {
  padding: 100px 100px 100px;
}
/* コンテンツ3 */
.contents3 {
  position: relative;
  overflow: hidden;
  margin: 55px 0;
}
.contents3:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 120%;
  height: 80%;
  margin: 0% -10% 0;
  background: #eae8e8;
  -webkit-transform-origin: left center;
  -ms-transform-origin: left center;
  transform-origin: left center;
  -webkit-transform: rotate(3deg);
  -ms-transform: rotate(3deg);
  transform: rotate(3deg);
  z-index: 2;
}

.contents3:after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 120%;
  height: 80%;
  margin: 0% -10% 0;
  background: #faff96;
  -webkit-transform-origin: right center;
  -ms-transform-origin: right center;
  transform-origin: right center;
  -webkit-transform: rotate(-3deg);
  -ms-transform: rotate(-3deg);
  transform: rotate(-3deg);
  z-index: 1;
}

.contents_inner3 {
  padding: 100px 100px 100px;
}
/* コンテンツ4 */
.contents4 {
  position: relative;
  overflow: hidden;
  margin: 10% 0;
  padding: 80px 0;
}
.contents4:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 120%;
  height: 80%;
  margin: 3% -10% 0;
  background: #eae8e8;
  -webkit-transform-origin: left center;
  -ms-transform-origin: left center;
  transform-origin: left center;
  -webkit-transform: rotate(3deg);
  -ms-transform: rotate(3deg);
  transform: rotate(3deg);
  z-index: 2;
}

.contents4:after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 120%;
  height: 80%;
  margin: 3% -10% 0;
  background: #faff96;
  -webkit-transform-origin: right center;
  -ms-transform-origin: right center;
  transform-origin: right center;
  -webkit-transform: rotate(-3deg);
  -ms-transform: rotate(-3deg);
  transform: rotate(-3deg);
  z-index: 1;
}

.contents_inner4 {
  box-sizing: boder-box;
  width: 100%;
  max-width: 640px;
  height: 100%;
  margin: 0 auto;
  padding: 100px 10px 120px;
  color: black;
  text-align: center;
  z-index: 2;
}
</style>
