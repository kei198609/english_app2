<template>
  <v-container>
    <v-card class="pb-8">
      <user-form-card>
        <!-- 以下のように書くことでUserFormCardの22行目に差し込める -->
        <template
          #user-form-card-content
        >
          <v-form
            ref="form"
            v-model="isValid"
          >
            <user-form-email
              :email.sync="params.user.email"
            />
            <user-form-password
              :password.sync="params.user.password"
            />
            <v-card-text class="px-0">
              <v-btn
                :disabled="!isValid || loading"
                :loading="loading"
                block
                color="appblue"
                class="white--text"
                @click="login"
              >
                ログインする
              </v-btn>
            </v-card-text>
          </v-form>
        </template>
      </user-form-card>
    </v-card>
  </v-container>
</template>

<script>
export default {
  layout: 'before-login',
  data ({ $store }) {
    return {
      isValid: false,
      loading: false,
      params: { user: { email: '', password: '' } },
      redirectPath: $store.state.loggedIn.homePath
    }
  },
  methods: {
    async login () {
      this.loading = true
      try {
        // Authモジュールの`loginWith`メソッドを使用してログイン
        const response = await this.$auth.loginWith('local', {
          data: {
            email: this.params.user.email,
            password: this.params.user.password
          }
        })
        console.log('Authenticated user:', this.$auth.user) // ログイン後のユーザー情報をログに出力
        console.log('loggedIn:', this.$auth.loggedIn)
        console.log(response)
      } catch (err) {
        console.error(err)
      } finally {
        this.loading = false
      }
      this.$router.push(this.redirectPath)
    }
  }
}
</script>
