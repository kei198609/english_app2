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
            <v-card class="pb-8 bordered-card">
              <user-form-card-change>
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
              </user-form-card-change>
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
import UserFormPasswordConfirm from '~/components/User/UserFormPasswordConfirm.vue'
import UserFormCardChange from '~/components/User/UserFormCardChange.vue'
import LinkList from '~/components/LinkList.vue'
export default {
  components: { UserFormPasswordConfirm, UserFormCardChange, LinkList },
  data () {
    return {
      valid: true,
      snackbar: false,
      snackbarMessage: '',
      snackbarColor: 'success',
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
        { title: '公開用プロフィール', link: `/top/${this.$auth.user.id}/profile` },
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

<style scoped>
.bordered-card {
  border-top: 3px solid #7097C3;
}
</style>
