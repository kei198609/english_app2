<template>
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
          color="appblue"
          class="white--text"
          @click="signup"
        >
          登録する
        </v-btn>
      </v-form>
    </template>
  </user-form-card>
</template>

<script>
export default {
  layout: 'before-login',
  data () {
    return {
      isValid: false,
      loading: false,
      params: { user: { name: '', email: '', password: '', occupation: '' } },
      redirectPath: '/tops'
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
      // ユーザーが正常にサインアップした後、topsページに遷移します
      this.$router.push(this.redirectPath)
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
