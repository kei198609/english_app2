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
          <v-col cols="12" md="4" lg="4">
            <UserSection v-if="user" :user="user" />
          </v-col>
          <v-col cols="12" md="8" lg="8">
            <div>
              <v-card class="px-3 py-3">
                <p v-for="(sentence, index) in sentenceJapanese" :key="index">
                  {{ sentence }}
                </p>
                <draggable v-model="words" tag="ul">
                  <v-list-item v-for="word in words" :key="word" class="draggable-item">
                    <v-list-item-content>
                      {{ word }}
                    </v-list-item-content>
                  </v-list-item>
                </draggable>
                <v-btn color="primary" @click="submitAnswer">決定する</v-btn>
              </v-card>
            </div>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import draggable from 'vuedraggable'
import UserSection from '~/components/UserSection.vue'

export default {
  components: {
    draggable,
    UserSection
  },
  data () {
    return {
      drawer: null,
      user: null,
      selectedWords: [],
      quiz: {},
      words: [],
      sentenceJapanese: []
    }
  },
  // async asyncData ({ params, $axios }) {
  //   const response = await $axios.get(`/api/v1/quizzes/${params.id}`)
  //   const quiz = response.data
  //   // JSON形式の文字列を解析して配列に変換
  //   const words = JSON.parse(quiz.sentence_english)
  //   const sentenceJapanese = JSON.parse(quiz.sentence_japanese)
  //   // 配列をシャッフル
  //   const shuffledWords = words.sort(() => 0.5 - Math.random())

  //   return {
  //     quiz,
  //     words: shuffledWords,
  //     sentenceJapanese
  //   }
  // },
  async fetch () {
    try {
      if (this.$auth.loggedIn) {
        // ログインしているユーザーのIDを取得
        const userId = this.$auth.user.id
        // ユーザーの詳細情報を取得
        const userResponse = await this.$axios.get(`/api/v1/users/${userId}`)
        this.user = userResponse.data.user

        // クイズのデータを取得
        const response = await this.$axios.get(`/api/v1/quizzes/${this.$route.params.id}`)
        const quiz = response.data
        // JSON形式の文字列を解析して配列に変換
        const words = JSON.parse(quiz.sentence_english)
        const sentenceJapanese = JSON.parse(quiz.sentence_japanese)
        // 配列をシャッフル
        const shuffledWords = words.sort(() => 0.5 - Math.random())

        // データを更新
        this.quiz = quiz
        this.words = shuffledWords
        this.sentenceJapanese = sentenceJapanese
      }
    } catch (error) {
      console.error('Error fetching data', error)
    }
  },
  methods: {
    async submitAnswer () {
      try {
        const response = await this.$axios.$post('/api/v1/quiz_attempts', {
          quiz_id: this.quiz.id,
          user_answer: this.words.join(' ')
        })
        this.user.points = response.current_points
        this.user.level = response.current_level
        if (response.correct) {
          alert('正解！')
        } else {
          alert('不正解')
        }
      } catch (error) {
        console.error(error)
      }
    }
  }
}
</script>

<style scoped>
.draggable-item {
  background-color: #ffffff;
  border-radius: 10px;
  margin: 8px 0;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.3s ease, transform 0.3s ease;
}

.draggable-item:hover {
  box-shadow: 0 6px 8px rgba(0, 0, 0, 0.12);
  transform: scale(1.01);
}

.draggable-item:active {
  box-shadow: 0 2px 2px rgba(0, 0, 0, 0.08);
}
</style>
