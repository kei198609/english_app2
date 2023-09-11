<template>
  <div>
    <v-row class="mb-3">
      <v-col cols="6" class="text-center">
        <div>{{ user.level }}</div>
        <div>Level</div>
      </v-col>
      <v-col cols="6" class="text-center">
        <div>{{ user.points }}</div>
        <div>Point</div>
      </v-col>
      <v-col cols="12" class="text-center">
        <v-progress-linear
          :value="calculateProgress(user.points)"
          color="primary"
          height="20"
        />
      </v-col>
    </v-row>
  </div>
</template>

<script>
export default {
  props: {
    user: {
      type: Object,
      required: true
    }
  },
  methods: {
    calculateProgress (points) {
      const MAX_POINTS = 100 // 最大ポイント
      return (points % MAX_POINTS) / MAX_POINTS * 100 // パーセンテージを返す
    }
  }
}
</script>
