<template>
  <v-app>
    <home-app-bar
      :img-height="imgHeight"
    />
    <v-btn
      fab
      dark
      fixed
      bottom
      right
      color="primary"
      @click="scrollToTop"
    >
      <v-icon>mdi-chevron-up</v-icon>
    </v-btn>
    <v-img
      class="image-border"
      :src="require('@/assets/images/landing/bg_large.png')"
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

    <v-img v-bind:src="image_src" class="custom-image-size">
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
        <section class="about">
          <div class="contents_inner_one">
            <div class="menu">
              <v-row>
                <v-col cols="12" md="6" lg="6" class="flex-container-vertical">
                  <h1 class="heading-large">
                    英文並び替え問題
                  </h1>
                  <p>ゲーム感覚で学び、<br>
                    ビジネスメール英語の感覚を磨きます。</p>
                </v-col>
                <v-col cols="12" md="6" lg="6" class="flex-container">
                  <img src="~assets/images/landing/並び替え問題.png" alt="画像1" class="image">
                </v-col>
              </v-row>
            </div>
          </div>
        </section>
        <section class="about">
          <div class="contents_inner_two">
            <div class="menu">
              <v-row>
                <v-col cols="12" md="6" lg="6" class="flex-container-vertical text-container">
                  <h1 class="heading-large">
                    ビジネスメールの基礎
                  </h1>
                  <p>実際のビジネスシーンで使える、<br>
                    基本的なビジネスメールの書き方を学びます。</p>
                </v-col>
                <v-col cols="12" md="6" lg="6" class="flex-container image-container">
                  <img src="~assets/images/landing/基礎チェック問題.png" alt="画像2" class="image">
                </v-col>
              </v-row>
            </div>
          </div>
        </section>
        <section class="about">
          <div class="contents_inner_three">
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
        <section class="about">
          <div class="contents_inner_four">
            <div class="menu">
              <v-row>
                <v-col cols="12" md="6" lg="6" class="flex-container-vertical text-container">
                  <h1 class="heading-large">
                    記事投稿
                  </h1>
                  <p>メールに関する記事を投稿して、<br>
                    他のユーザと共有できます。</p>
                </v-col>
                <v-col cols="12" md="6" lg="6" class="flex-container image-container">
                  <img src="~assets/images/landing/役立つ記事.png" alt="画像4" class="image">
                </v-col>
              </v-row>
            </div>
          </div>
        </section>
        <section class="about">
          <div class="contents_inner_five">
            <div class="menu">
              <v-row>
                <v-col cols="12" md="6" lg="6" class="flex-container-vertical">
                  <h1 class="heading-large">
                    解決できる悩み
                  </h1>
                  <p>初めて書くビジネス英語メールの<br>
                    モヤモヤを解決できます。</p>
                </v-col>
                <v-col cols="12" md="6" lg="6" class="flex-container">
                  <img src="~assets/images/landing/解決できる悩み.png" alt="画像5" class="image">
                </v-col>
              </v-row>
            </div>
          </div>
        </section>
        <section>
          <div class="contents_inner_six">
            <div class="menu">
              <v-row justify="center">
                <v-col cols="12" class="text-center mb-10">
                  <h1 class="heading-large">今すぐ始めよう！</h1>
                </v-col>
                <v-col cols="12" md="6" lg="6" class="flex-container-vertical">
                  <TryLoginButton />
                </v-col>
                <v-col cols="12" md="6" lg="6" class="flex-container">
                  <SignupButton />
                </v-col>
              </v-row>
            </div>
          </div>
        </section>
    </v-img>
    <app-footer />
  </v-app>
</template>

<script>
import TryLoginButton from '~/components/Button/TryLoginButton.vue'
import SignupButton from '~/components/Button/SignupButton.vue'

export default {
  components: {
    TryLoginButton,
    SignupButton
  },
  data () {
    return {
      image_src: require('@/assets/images/landing/bg_main_large.png'),
      imgHeight: 400
    }
  },
  methods: {
    scrollToTop () {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      })
    }
  }
}
</script>

<style>
/* ベーススタイル モバイルファースト */
.image-border {
  border-top: 2px solid #ffbf00;
  border-bottom: 2px solid #ffbf00;
}
.heading-large {
  font-size: 1.6em;
}
/* 480px以下の画面幅で適用されるスタイル */
@media (max-width: 480px) {
  .custom-image-size {
    height: 4200px;
  }
  .contents_inner_one {
    padding: 190px 100px 100px;
  }
  .contents_inner_two {
    padding: 70px 100px 100px;
  }
  .contents_inner_three {
    padding: 70px 100px 100px;
  }
  .contents_inner_four {
    padding: 70px 100px 100px;
  }
  .contents_inner_five {
    padding: 100px 100px 100px;
  }
  .contents_inner_six {
    padding: 300px 100px 100px;
  }
}
/* 481pxから768pxの画面幅で適用されるスタイル */
@media (min-width: 481px) and (max-width: 768px) {
  .custom-image-size {
    height: 4200px;
  }
  .contents_inner_one {
    padding: 180px 100px 100px;
  }
  .contents_inner_two {
    padding: 50px 100px 100px;
  }
  .contents_inner_three {
    padding: 50px 100px 100px;
  }
  .contents_inner_four {
    padding: 50px 100px 100px;
  }
  .contents_inner_five {
    padding: 120px 100px 100px;
  }
  .contents_inner_six {
    padding: 300px 100px 100px;
  }
}
/* 768px以上の画面幅で適用されるスタイル */
@media (min-width: 768px) {
  .heading-large {
    font-size: 2.0em;
  }
  .custom-image-size {
    height: 4000px;
  }
  .contents_inner_one {
    padding: 120px 100px 100px;
  }
  .contents_inner_two {
    padding: 20px 100px 100px;
  }
  .contents_inner_three {
    padding: 20px 100px 100px;
  }
  .contents_inner_four {
    padding: 20px 100px 100px;
  }
  .contents_inner_five {
    padding: 80px 100px 100px;
  }
  .contents_inner_six {
    padding: 250px 100px 100px;
  }
}

/* 960px以上の画面幅で適用されるスタイル */
@media (min-width: 960px) {
  .custom-image-size {
    height: 3600px;
  }
  .contents_inner_one {
    padding: 150px 100px 100px;
  }
  .contents_inner_two {
    padding: 80px 100px 100px;
  }
  .contents_inner_three {
    padding: 80px 100px 100px;
  }
  .contents_inner_four {
    padding: 80px 100px 100px;
  }
  .contents_inner_five {
    padding: 130px 100px 100px;
  }
  .contents_inner_six {
    padding: 300px 100px 100px;
  }
    /* 順序の変更 */
  .text-container {
    order: 2; /* テキストを右側に配置 */
  }
  .image-container {
    order: 1; /* 画像を左側に配置 */
  }
}
/* 1280px以上の画面幅で適用されるスタイル */
@media (min-width: 1280px) {
  .custom-image-size {
    height: 3600px;
  }
  .contents_inner_one {
    padding: 130px 100px 100px;
  }
  .contents_inner_two {
    padding: 70px 100px 100px;
  }
  .contents_inner_three {
    padding: 70px 100px 100px;
  }
  .contents_inner_four {
    padding: 70px 100px 100px;
  }
  .contents_inner_five {
    padding: 100px 100px 100px;
  }
  .contents_inner_six {
    padding: 300px 100px 100px;
  }
    /* 順序の変更 */
  .text-container {
    order: 2; /* テキストを右側に配置 */
  }
  .image-container {
    order: 1; /* 画像を左側に配置 */
  }
}

/* 1700px以上の画面幅で適用されるスタイル */
@media (min-width: 1700px) {
  .custom-image-size {
    height: 4500px;
  }
  .contents_inner_one {
    padding: 200px 100px 100px;
  }
  .contents_inner_two {
    padding: 200px 100px 100px;
  }
  .contents_inner_three {
    padding: 200px 100px 100px;
  }
  .contents_inner_four {
    padding: 200px 100px 100px;
  }
  .contents_inner_five {
    padding: 200px 100px 100px;
  }
  .contents_inner_six {
    padding: 400px 100px 100px;
  }
}

.about {
  display: flex;
  justify-content: center;
  text-align: center;
  margin: 3% 0 0 0;
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
</style>
