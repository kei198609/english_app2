<template>
  <div>
    <v-row class="mt-3">
      <v-col cols="12" class="text-center">
        <v-subheader>レベル: {{ user.level }}ポイント: {{ user.points }}</v-subheader>
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
