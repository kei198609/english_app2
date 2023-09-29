<template>
  <v-app>
    <logged-in-app-bar clipped-left>
      <template v-slot:navigation-toggle-button>
        <v-app-bar-nav-icon
          @click="drawer = !drawer"
        />
      </template>
    </logged-in-app-bar>
    <!-- ナビゲーションドロワー -->
    <top-navigation-drawer
      :drawer.sync="drawer"
    />
    <v-main>
      <v-container>
        <div>
          <v-card outlined class="px-3 py-3">
            <v-form @submit.prevent="createPost">
              <v-select
                v-model="post.genre"
                :items="genres"
                label="ジャンル"
                outlined
              ></v-select>

              <v-textarea
                v-model="post.title"
                label="タイトル"
                outlined
              ></v-textarea>

              <v-textarea
                v-model="post.content"
                label="内容"
                outlined
              ></v-textarea>

              <v-btn type="submit" color="primary">投稿する</v-btn>
            </v-form>
          </v-card>
        </div>
        <v-snackbar v-model="snackbar" top right color="success" outlined>
          {{ snackbarMessage }}
          <v-btn color="black" text @click="snackbar = false">
            閉じる
          </v-btn>
      </v-snackbar>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
export default {
  data () {
    return {
      drawer: null,
      snackbar: false,
      snackbarMessage: '',
      post: {
        title: '',
        content: '',
        genre: ''
      },
      genres: ['ビジネス文書', '英語メール表現', '一般的な英文メッセージ', 'その他']
    }
  },

  methods: {
    async createPost () {
      try {
        const response = await this.$axios.post('/api/v1/posts', {
          post: {
            genre: this.post.genre,
            title: this.post.title,
            content: this.post.content
          }
        }, {
          headers: {
            'access-token': localStorage.getItem('access-token'),
            client: localStorage.getItem('client'),
            uid: localStorage.getItem('uid')
          }
        })
        console.log(response)
      } catch (err) {
        console.error(err)
      }
      this.snackbar = true
      this.snackbarMessage = '投稿しました。マイページから確認できます。'
    }
  }
}
</script>
