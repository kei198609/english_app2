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
          <v-col cols="12" md="4">
            <link-list :items="items" />
          </v-col>
          <v-col cols="12" md="8">
            <v-card class="px-3 py-3">
              <h1 class="my-8 text-h5 font-weight-bold">
                アカウント
              </h1>
              <div>
                <img :src="avatarUrl" class="rounded-circle avatar-size" />
              </div>
              <div class="mt-4">
                <input type="file" @change="onFileChange" />
              </div>
              <div class="mt-4">
                <v-btn color="red" @click="deleteAccount" v-if="!isGuestUser">
                  アカウント削除
                </v-btn>
              </div>
            </v-card>
          </v-col>
          <v-snackbar
            v-model="snackbar"
            top
            right
            :color="snackbarColor"
            :timeout="3000"
          >
            {{ snackbarMessage }}
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
      isGuestUser: this.$auth.user.email === 'guest@example.com',
      snackbar: false,
      snackbarMessage: '',
      snackbarColor: 'success',
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
    const storedUser = localStorage.getItem(`user_${this.$auth.user.id}`)
    if (storedUser) {
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

<style scoped>
.avatar-size {
  width: 100px;
  height: 100px;
}
</style>
