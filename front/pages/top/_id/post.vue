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
        <div>
          <v-form @submit.prevent="createPost">
            <v-select
              v-model="post.scene"
              :items="scenes"
              label="ビジネスシーン"
              required
            ></v-select>

            <v-textarea
              v-model="post.subjectEnglish"
              label="件名"
              required
            ></v-textarea>

            <v-textarea
              v-model="post.contentEnglish"
              label="メール本文"
              required
            ></v-textarea>

            <v-btn type="submit" color="primary">投稿する</v-btn>
          </v-form>
        </div>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
export default {
  data () {
    return {
      drawer: null,
      post: {
        scene: '',
        subjectEnglish: '',
        contentEnglish: ''
      },
      scenes: ['アポイントメント', '日程調整', '依頼', '問い合わせ', '報告', 'お礼', '謝罪', 'クレーム', '確認', '提案', '催促', 'その他']
    }
  },

  methods: {
    async createPost () {
      try {
        const response = await this.$axios.post('/api/v1/posts', {
          post: {
            scene: this.post.scene,
            subject_english: this.post.subjectEnglish,
            content_english: this.post.contentEnglish
          }
        }, {
          headers: {
            'access-token': localStorage.getItem('access-token'),
            client: localStorage.getItem('client'),
            uid: localStorage.getItem('uid')
          }
        })
        console.log(response)
      } catch (err) {
        console.error(err)
      }
    }
  }
}
</script>
