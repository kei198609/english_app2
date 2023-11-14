<template>
  <v-row>
    <v-col>
      <v-card class="pa-4">
        <div class="text-center mb-4">
          登場人物
        </div>
        <div class="d-flex align-start mb-4">
          <img src="~assets/images/character/yuta.png" alt="ユウタ" class="character-image">
          <div class="ml-3">
            <h3>ユウタ</h3>
            <p>オフィス勤務の若手社員。英文ビジネスメールに自信がない。</p>
          </div>
        </div>
        <div class="d-flex align-start">
          <img src="~assets/images/character/risa.png" alt="リサ" class="character-image">
          <div class="ml-3">
            <h3>リサ</h3>
            <p>オフィスでの先輩。英文ビジネスメールの経験者。</p>
          </div>
        </div>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {

}
</script>

<style scoped>
.character-image {
  width: 60px;
  height: 60px;
  border-radius: 50%;
}

h3 {
  margin-bottom: 0.5rem;
}

p {
  color: #777;
}
</style>
