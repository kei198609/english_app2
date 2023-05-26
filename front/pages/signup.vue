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
      params: { user: { name: '', email: '', password: '' } }
    }
  },
  methods: {
    signup () {
      this.loading = true
      setTimeout(() => {
        this.formReset()
        this.loading = false
      }, 1500)
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
