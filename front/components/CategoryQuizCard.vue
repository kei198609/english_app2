<template>
  <v-card>
    <v-list-item>
      <v-list-item-content>
        {{ category.category_name }}
      </v-list-item-content>
    </v-list-item>
    <v-list v-for="q in category.quizzes" :key="q.id">
      <v-list-item>
        <!-- クイズタイトルとリンク -->
        <nuxt-link :to="`/quiz/${q.id}`">{{ q.title }}</nuxt-link>
        <!-- 正誤表示 -->
        <span v-if="getQuizAttempt(q.id)">
          {{ getQuizAttempt(q.id).correct ? '正解済み' : '不正解' }}
        </span>
      </v-list-item>
    </v-list>
  </v-card>
</template>

<script>
export default {
  props: {
    category: {
      type: Object,
      required: true
    },
    getQuizAttempt: {
      type: Function,
      required: true
    }
  }
}
</script>
