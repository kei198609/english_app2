<template>
  <v-container>
    <v-row>
      <v-col cols="12" md="6">
        <v-form ref="form" v-model="valid">
          <v-text-field
            v-model="currentPassword"
            :rules="[rules.required]"
            label="現在のパスワード"
            type="password"
          ></v-text-field>
          <v-text-field
            v-model="newPassword"
            :rules="[rules.required, rules.min]"
            label="新しいパスワード"
            type="password"
          ></v-text-field>
          <v-text-field
            v-model="newPasswordConfirmation"
            :rules="[rules.required, rules.passwordMatch]"
            label="新しいパスワード確認"
            type="password"
          ></v-text-field>
          <v-btn
            :disabled="!valid"
            color="primary"
            @click="changePassword"
          >
            パスワード変更
          </v-btn>
        </v-form>
      </v-col>
    </v-row>

    <v-snackbar v-model="snackbar" bottom right color="success">
      {{ snackbarMessage }}
      <v-btn color="white" text @click="snackbar = false">
        閉じる
      </v-btn>
    </v-snackbar>

  </v-container>
</template>

<script>
export default {
  data () {
    return {
      valid: true,
      currentPassword: '',
      newPassword: '',
      newPasswordConfirmation: '',
      snackbar: false,
      snackbarMessage: '',
      rules: {
        required: value => !!value || 'Required.',
        min: value => value.length >= 8 || 'Min 8 characters',
        passwordMatch: value => value === this.newPassword || 'Password does not match'
      }
    }
  },
  methods: {
    async changePassword () {
      if (this.$refs.form.validate()) {
        try {
          const response = await this.$axios.put('/api/v1/auth', {
            user: {
              current_password: this.currentPassword,
              password: this.newPassword,
              password_confirmation: this.newPasswordConfirmation
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
          this.currentPassword = ''
          this.newPassword = ''
          this.newPasswordConfirmation = ''
        } catch (err) {
          console.error(err)
        }
      }
    }
  }
}
</script>
