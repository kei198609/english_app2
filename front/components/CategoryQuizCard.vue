<template>
  <div>
    <v-card class="px-3 py-3 mb-3">
      <v-list-item-content>
        タスク一覧
      </v-list-item-content>
    </v-card>
    <v-card>
      <v-list-item>
        <v-list-item-content>
          {{ category.category_name }}
        </v-list-item-content>
      </v-list-item>
      <v-list v-for="q in category.quizzes" :key="q.id">
        <v-list-item :to="`/quiz/${q.id}`">
          <v-row>
            <v-col class="flex-grow-1">
              <v-list-item-title>
                {{ q.title }}
              </v-list-item-title>
            </v-col>
              <v-col v-if="getQuizAttempt(q.id)">
                <v-list-item-subtitle>
                  {{ getQuizAttempt(q.id).correct ? '正解済み' : '不正解' }}
                </v-list-item-subtitle>
              </v-col>
          </v-row>
        </v-list-item>
      </v-list>
    </v-card>
  </div>
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
