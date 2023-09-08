<template>
  <v-container>
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

    <v-snackbar v-model="snackbar" top right color="success" outlined>
      {{ snackbarMessage }}
      <v-btn color="black" text @click="snackbar = false">
        閉じる
      </v-btn>
    </v-snackbar>

  </v-container>
</template>

<script>
import UserFormPasswordConfirm from '../../components/User/UserFormPasswordConfirm.vue'
import UserFormCardChange from '../../components/User/UserFormCardChange.vue'
export default {
  components: { UserFormPasswordConfirm, UserFormCardChange },
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
      }
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
