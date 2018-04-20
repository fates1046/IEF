<template lang="html">
  <div id="home">
    <div class="ui vertical segment" id="ataglance">
      <div class="ui middle aligned stackable grid container">
        <div class="row">
          <div class="eight wide column">
            <h1>IEF(Infinite Evolution Fund)</h1>
            <h3>Cloud Asset Management</h3>
            <p>- Collective Intelligence</p>
            <p>- Community Participation</p>
            <h3>Evolution Mechanism</h3>
            <p>- League System</p>
            <p>- Dynamic Asset Allocation</p>
          </div>
          <div class="six wide right floated column">
            <signup></signup>
          </div>
        </div>
      </div>
    </div>
    <div class="ui vertical segment start-page">
      <div class="ui middle aligned center container">
        <h1>IEF Fund is...</h1>
        <h3>empty</h3>
        <h3>empty</h3>
        <h3>empty</h3>
        <h3>empty</h3>
        <h3>empty</h3>
        <h3>empty</h3>
      </div>
    </div>
    <div class="ui vertical segment start-page">
      <div class="ui middle aligned center container">
        <h1>TOP MANAGER</h1>
        <h3>empty</h3>
        <h3>empty</h3>
        <h3>empty</h3>
        <h3>empty</h3>
        <h3>empty</h3>
      </div>
    </div>
    <div class="ui vertical segment start-page">
      <div class="ui middle aligned center container">
        <h1>Empty Area</h1>
        <h3>empty</h3>
        <h3>empty</h3>
        <h3>empty</h3>
        <h3>empty</h3>
        <h3>empty</h3>
      </div>
    </div>
  </div>
</template>

<script>
import Signup from './home/Signup.vue'
export default {
  components: {
    Signup
  }
}
</script>

<style lang="css">
#ataglance{
  color: #ffffff;
  background-color: #212121;
  height:470px;
}
.start-page {
  text-align: center;
}

.ui.vertical.segment {
  padding-bottom: 30px;
}
</style>
