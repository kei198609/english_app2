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
            <div>パスワード</div>
            <user-from-card-change>
              <template #user-form-card-change-content>
                <v-form ref="form" v-model="valid">
                  <user-form-password-current
                    :password.sync="params.user.currentPassword"
                    set-validation
                  />
                  <user-form-password-new
                    :password.sync="params.user.newPassword"
                    set-validation
                    :check-password-match="checkPasswordMatch"
                  />
                  <user-form-password-confirm
                    :password.sync="params.user.newPasswordConfirmation"
                    set-validation
                    :check-password-match="checkPasswordMatch"
                  />
                  <v-btn
                    :disabled="!valid"
                    color="primary"
                    @click="changePassword"
                  >
                    パスワード変更
                  </v-btn>
                </v-form>
              </template>
            </user-from-card-change>
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
import UserFormPasswordConfirm from '~/components/User/UserFormPasswordConfirm.vue'
import UserFromCardChange from '~/components/User/UserFromCardChange.vue'
import LinkList from '~/components/LinkList.vue'
export default {
  components: { UserFormPasswordConfirm, UserFromCardChange, LinkList },
  data () {
    return {
      valid: true,
      snackbar: false,
      snackbarMessage: '',
      params: {
        user: {
          currentPassword: '',
          newPassword: '',
          newPasswordConfirmation: ''
        }
      },
      drawer: null,
      items: [
        { title: 'アカウント', link: `/top/${this.$auth.user.id}/settings` },
        { title: '公開用プロフィール', link: '' },
        { title: 'パスワード', link: `/top/${this.$auth.user.id}/password` },
        { title: 'メールアドレス', link: `/top/${this.$auth.user.id}/email` }
      ]
    }
  },
  methods: {
    checkPasswordMatch (value) {
      return value === this.params.user.newPassword
    },
    async changePassword () {
      if (this.$refs.form.validate()) {
        try {
          const response = await this.$axios.put('/api/v1/auth', {
            user: {
              current_password: this.params.user.currentPassword,
              password: this.params.user.newPassword,
              password_confirmation: this.params.user.newPasswordConfirmation
            }
          }, {
            headers: {
              'access-token': localStorage.getItem('access-token'),
              client: localStorage.getItem('client'),
              uid: localStorage.getItem('uid')
            }
          })
          console.log(response)
          // Password change was successful
          this.snackbar = true
          this.snackbarMessage = 'パスワードが変更されました'
          this.params.user.currentPassword = ''
          this.params.user.newPassword = ''
          this.params.user.newPasswordConfirmation = ''
        } catch (err) {
          console.error(err)
        }
      }
    }
  }
}
</script>