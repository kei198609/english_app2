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
            <user-form-name
              :name.sync="params.user.name"
            />
            <user-form-occupation
              :occupation.sync="params.user.occupation"
            />
            <user-form-email
              :email.sync="params.user.email"
              placeholder
            />
            <user-form-password
              :password.sync="params.user.password"
              set-validation
            />
            <!-- disabledがtrueの時、ボタンクリックを無効にする
            loading中はクリックできない -->
            <v-btn
              :disabled="!isValid || loading"
              :loading="loading"
              block
              color="appyellow"
              class="white--text"
              @click="signup"
            >
              登録する
            </v-btn>
          </v-form>
        </template>
      </user-form-card>
    </v-card>
    <v-snackbar
      v-model="snackbar"
      top
      right
      :color="snackbarColor"
      :timeout="3000"
    >
      {{ snackbarMessage }}
    </v-snackbar>
  </v-container>
</template>

<script>
export default {
  layout: 'before-login',
  data () {
    return {
      snackbar: false,
      snackbarMessage: '',
      snackbarColor: 'success',
      isValid: false,
      loading: false,
      params: { user: { name: '', email: '', password: '', occupation: '' } }
    }
  },
  methods: {
    async signup () {
      this.loading = true

      try {
        await this.$axios.post('/api/v1/auth', {
          user: {
            name: this.params.user.name,
            email: this.params.user.email,
            password: this.params.user.password,
            occupation: this.params.user.occupation
          }
        })
      } catch (e) {
        console.error(e)
      }

      this.formReset()
      this.loading = false
      this.snackbar = true
      this.snackbarMessage = '登録しました。ログインしてください。'
    },
    formReset () {
      this.$refs.form.reset()
      for (const key in this.params.user) {
        this.params.user[key] = ''
      }
    }
  }
}
</script>
