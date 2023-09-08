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
        <v-row>
          <link-list :items="items" />
          <v-col cols="8">
            <div>アカウント</div>
            <div>
              <img :src="avatarUrl" class="rounded-circle" />
            </div>
            <div class="mt-4">
              <input type="file" @change="onFileChange" />
            </div>
            <div class="mt-4">
              <v-btn color="red" @click="deleteAccount" >
                アカウント削除
              </v-btn>
            </div>
          </v-col>
          <v-snackbar v-model="snackbar" top right color="success" outlined>
            {{ snackbarMessage }}
            <v-btn color="black" text @click="snackbar = false">
              閉じる
            </v-btn>
          </v-snackbar>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import LinkList from '~/components/LinkList.vue'
export default {
  components: { LinkList },
  data () {
    return {
      snackbar: false,
      snackbarMessage: '',
      avatarUrl: require('~/assets/images/noimage.jpg'),
      drawer: null,
      items: [
        { title: 'アカウント', link: `/top/${this.$auth.user.id}/settings` },
        { title: '公開用プロフィール', link: `/top/${this.$auth.user.id}/profile` },
        { title: 'パスワード', link: `/top/${this.$auth.user.id}/password` },
        { title: 'メールアドレス', link: `/top/${this.$auth.user.id}/email` }
      ]
    }
  },
  mounted () {
    console.log(this.$config.apiBaseUrl)
    const storedUser = localStorage.getItem(`user_${this.$auth.user.id}`)
    if (storedUser) {
      console.log(JSON.parse(storedUser)) // ローカルストレージ内のデータをログ出力
      // this.avatarUrl = `${this.$config.apiBaseUrl}${JSON.parse(storedUser).avatar_url}`
      this.avatarUrl = JSON.parse(storedUser).avatar_url
    }
  },
  methods: {
    async onFileChange (e) {
      const file = e.target.files[0]
      const formData = new FormData()
      formData.append('user[avatar]', file)
      try {
        const response = await this.$axios.put(`/api/v1/users/${this.$auth.user.id}/avatar`, formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
            'access-token': localStorage.getItem('access-token'),
            client: localStorage.getItem('client'),
            uid: localStorage.getItem('uid')
          }
        })
        // console.log(response) // レスポンス全体をログに出力
        // console.log(response.data.avatar_url) // avatar_urlだけをログに出力
        // this.avatarUrl = `${this.$config.apiBaseUrl}${response.data.avatar_url}`
        this.avatarUrl = response.data.avatar_url
        localStorage.setItem(`user_${this.$auth.user.id}`, JSON.stringify(response.data)) // ここでローカルストレージに保存
        this.snackbar = true
        this.snackbarMessage = 'アイコン画像が変更されました'
      } catch (err) {
        console.error(err)
        this.snackbar = true
        this.snackbarMessage = 'アバターのアップロードに失敗しました'
      }
    },
    async deleteAccount () {
      try {
        await this.$axios.delete('api/v1/auth', {
          headers: {
            'access-token': localStorage.getItem('access-token'),
            uid: localStorage.getItem('uid'),
            client: localStorage.getItem('client')
          }
        })
        this.$auth.reset() // クライアントサイドのセッションだけをクリア
        this.$router.push('/')// ホームへリダイレクトする
        this.snackbar = true
        this.snackbarMessage = 'アカウントが削除されました'
      } catch (err) {
        console.error(err)
        this.snackbar = true
        this.snackbarMessage = 'アカウントの削除に失敗しました'
      }
    }
  }
}
</script>
