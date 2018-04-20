<template lang="html">
  <div>
    <h1>Setting Component</h1>
  </div>
</template>

<script>
export default {
  created () {
    this.$http.get('/db').then((response) => {
      console.log(response)
    })
  }
}
</script>

<style lang="css">
.ui {
  margin-bottom: 10px
}
</style>
