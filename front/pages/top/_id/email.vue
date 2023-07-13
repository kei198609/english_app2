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
            <div>メールアドレス</div>
            <user-form-card-change>
              <template #user-form-card-change-content>
                <v-form ref="form" v-model="valid">
                  <user-form-email
                    :email.sync="params.user.email"
                  />
                  <v-btn
                    :disabled="!valid"
                    color="primary"
                    @click="changeEmail"
                  >
                    保存
                  </v-btn>
                </v-form>
              </template>
            </user-form-card-change>
          </v-col>
          <v-snackbar v-model="snackbar" bottom right color="success">
            {{ snackbarMessage }}
            <v-btn color="white" text @click="snackbar = false">
              閉じる
            </v-btn>
          </v-snackbar>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import UserFormEmail from '~/components/User/UserFormEmail.vue'
import UserFormCardChange from '~/components/User/UserFormCardChange.vue'
import LinkList from '~/components/LinkList.vue'

export default {
  components: { UserFormEmail, UserFormCardChange, LinkList },
  data () {
    return {
      valid: true,
      snackbar: false,
      snackbarMessage: '',
      params: {
        user: {
          email: ''
        }
      },
      drawer: null,
      items: [
        { title: 'アカウント', link: `/top/${this.$auth.user.id}/settings` },
        { title: '公開用プロフィール', link: `/top/${this.$auth.user.id}/profile` },
        { title: 'パスワード', link: `/top/${this.$auth.user.id}/password` },
        { title: 'メールアドレス', link: `/top/${this.$auth.user.id}/email` }
      ]
    }
  },
  methods: {
    async changeEmail () {
      if (this.$refs.form.validate()) {
        try {
          const response = await this.$axios.put('/api/v1/auth', {
            user: {
              email: this.params.user.email
            }
          }, {
            headers: {
              'access-token': localStorage.getItem('access-token'),
              client: localStorage.getItem('client'),
              uid: localStorage.getItem('uid')
            }
          })
          console.log(response)
          // Email change was successful
          this.snackbar = true
          this.snackbarMessage = 'メールアドレスが変更されました'
          this.params.user.email = ''
        } catch (err) {
          console.error(err)
          if (err.response && err.response.status === 500) {
            this.snackbar = true
            this.snackbarMessage = '無効なメールアドレスです'
          }
        }
      }
    }
  }
}
</script>
