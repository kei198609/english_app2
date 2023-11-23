<template>
  <v-container>
    <v-row>
      <v-col cols="12" md="" lg="">
        <v-card class="image">
          <div class="section">
            <h3 class="header-text pt-10">「Mail Menter」の使い方</h3>
          </div>
          <div class="section">
            <img src="~assets/images/guide/fig1.png" alt="画像1" class="image">
            <p class="text-margin">
              基礎チェック問題の項目をクリックすると、知りたい内容のページに行けます。
              アプリを初めて使うときは、基礎チェック問題がおすすめです。
            </p>
          </div>
          <div class="section">
            <img src="~assets/images/guide/fig2.png" alt="画像2" class="image">
            <p class="text-margin">
              項目に関する記事が表示されています。
              「理解しました」ボタンをクリックすると、タスクが完了します。
            </p>
          </div>
          <div class="section">
            <img src="~assets/images/guide/fig3.png" alt="画像3" class="image">
            <p class="text-margin">
              並び替え問題の項目をクリックすると、問題のページに行けます。
            </p>
          </div>
          <div class="section">
            <img src="~assets/images/guide/fig4.png" alt="画像4" class="image">
            <p class="text-margin">
              日本語文に合致するように、英文をドラッグ&ドロップで並び替えて、
              「決定する」ボタンをクリックすると正誤判定されます。
            </p>
          </div>
          <div class="section">
            <img src="~assets/images/guide/fig5.png" alt="画像5" class="image">
            <p class="text-margin">
              学習状況はマイページから確認できます。
            </p>
          </div>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  layout: 'logged-in'
}
</script>

<style scoped>
.content-card {
  padding: 20px;
}

.header-text {
  font-size: 24px;
  font-weight: bold;
  margin: 20px auto;
  text-align: center;
}

.image {
  max-width: 100%;
  display: block;
  margin: 20px auto;
}

.section {
  margin-bottom: 30px;
}

p {
  max-width: 90%;
  margin: 10px auto;
}
</style>
