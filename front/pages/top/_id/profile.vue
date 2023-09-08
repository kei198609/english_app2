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
            <user-form-card-change>
              <template #user-form-card-change-content>
                <!-- Name Form -->
                <v-form ref="formName" v-model="validName">
                  <user-form-name
                    :name.sync="params.user.name"
                  />
                  <v-btn
                    :disabled="!validName"
                    color="primary"
                    @click="changeName"
                  >
                    名前を更新する
                  </v-btn>
                </v-form>
                <!-- Occupation Form -->
                <v-form ref="formOccupation" v-model="validOccupation">
                  <user-form-occupation
                    :occupation.sync="params.user.occupation"
                  />
                  <v-btn
                    :disabled="!validOccupation"
                    color="primary"
                    @click="changeOccupation"
                  >
                    職種を更新する
                  </v-btn>
                </v-form>
              </template>
            </user-form-card-change>
          </v-col>
          <v-snackbar v-model="snackbar" top right color="success" outlined>
            {{ snackbarMessage }}
            <v-btn color="black" text @click="snackbar = false">
              閉じる
            </v-btn>
          </v-snackbar>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import UserFormName from '~/components/User/UserFormName.vue'
import UserFormOccupation from '~/components/User/UserFormOccupation.vue'
import UserFormCardChange from '~/components/User/UserFormCardChange.vue'
import LinkList from '~/components/LinkList.vue'

export default {
  components: { UserFormName, UserFormOccupation, UserFormCardChange, LinkList },
  data () {
    return {
      validName: true,
      validOccupation: true,
      snackbar: false,
      snackbarMessage: '',
      params: {
        user: {
          name: '',
          occupation: ''
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
    async changeName () {
      if (this.$refs.formName.validate()) {
        try {
          const response = await this.$axios.put('/api/v1/auth', {
            user: {
              name: this.params.user.name
            }
          }, {
            headers: {
              'access-token': localStorage.getItem('access-token'),
              client: localStorage.getItem('client'),
              uid: localStorage.getItem('uid')
            }
          })
          console.log(response)
          // Name change was successful
          this.snackbar = true
          this.snackbarMessage = '名前が変更されました'
          this.params.user.name = ''
        } catch (err) {
          console.error(err)
          if (err.response && err.response.status === 500) {
            this.snackbar = true
            this.snackbarMessage = '無効な名前です'
          }
        }
      }
    },
    async changeOccupation () {
      if (this.$refs.formOccupation.validate()) {
        try {
          const response = await this.$axios.put('/api/v1/auth', {
            user: {
              occupation: this.params.user.occupation
            }
          }, {
            headers: {
              'access-token': localStorage.getItem('access-token'),
              client: localStorage.getItem('client'),
              uid: localStorage.getItem('uid')
            }
          })
          console.log(response)
          // Occupation change was successful
          this.snackbar = true
          this.snackbarMessage = '職種が変更されました'
          this.params.user.occupation = ''
        } catch (err) {
          console.error(err)
        }
      }
    }
  }
}
</script>
