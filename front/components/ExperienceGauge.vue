<template>
  <div>
    <div v-for="scene in scenes" :key="scene.experience_scene">
      <h3>{{ scene.experience_scene }}</h3>
      <v-progress-linear
        :value="calculateProgress(scene.xp)"
        color="primary"
        height="10"
      />
    </div>
  </div>
</template>

<script>
export default {
  props: {
    scenes: {
      type: Array,
      required: true
    }
  },
  methods: {
    calculateProgress (xp) {
      const MAX_XP = 3 // 最大経験値
      return (xp / MAX_XP) * 100 // パーセンテージを返す
    }
  }
}
</script>
