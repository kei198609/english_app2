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
            <v-alert
              v-if="isGuestUser"
              type="info"
              class="mt-4"
            >
              ゲストユーザのメールアドレスは変更できません。
            </v-alert>
          </v-col>
          <v-col cols="12" md="8">
            <v-card class="pb-8">
              <user-form-card-change>
                <template #user-form-card-change-content>
                  <v-form ref="form" v-model="valid">
                    <user-form-email
                      :email.sync="params.user.email"
                    />
                    <v-btn
                      :disabled="!valid || isGuestUser"
                      color="primary"
                      @click="changeEmail"
                    >
                      保存
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
import UserFormEmail from '~/components/User/UserFormEmail.vue'
import UserFormCardChange from '~/components/User/UserFormCardChange.vue'
import LinkList from '~/components/LinkList.vue'

export default {
  components: { UserFormEmail, UserFormCardChange, LinkList },
  data () {
    return {
      valid: true,
      isGuestUser: this.$auth.user.email === 'guest@example.com',
      snackbar: false,
      snackbarMessage: '',
      snackbarColor: 'success',
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
