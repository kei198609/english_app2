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
        </div>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import draggable from 'vuedraggable'

export default {
  components: {
    draggable
  },
  data () {
    return {
      drawer: null,
      selectedWords: []
    }
  },
  async asyncData ({ params, $axios }) {
    const response = await $axios.get(`/api/v1/quizzes/${params.id}`)
    const quiz = response.data
    // JSON形式の文字列を解析して配列に変換
    const words = JSON.parse(quiz.sentence_english)
    const sentenceJapanese = JSON.parse(quiz.sentence_japanese)
    // 配列をシャッフル
    const shuffledWords = words.sort(() => 0.5 - Math.random())

    return {
      quiz,
      words: shuffledWords,
      sentenceJapanese
    }
  },
  methods: {
    submitAnswer () {
      this.$axios.post('/api/v1/quiz_attempts', {
        quiz_id: this.quiz.id,
        selectedWords: this.selectedWords.join(' ')
      })
        .then((response) => {
          if (response.data.correct) {
            alert('正解！')
          } else {
            alert('不正解')
          }
        })
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
