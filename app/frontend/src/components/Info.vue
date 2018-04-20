<template lang="html">
  <div class="ui">
    <div>
      <div class="ui left fixed vertical menu" id="side-bar">
        <div class="item">
          <div class="header">Information</div>
          <div class="menu">
            <router-link to="/info/performance" class="item">Performance</router-link>
            <router-link to="/info/portfolio" class="item">Portfolio</router-link>
            <router-link to="/info/allocation" class="item">Allocation</router-link>
            <router-link to="/info/community" class="item">Community</router-link>
          </div>
        </div>
        <div class="item">
          <div class="header">Manager</div>
          <div class="menu">
            <router-link to="/info/trading" class="item">Trading</router-link>
          </div>
        </div>
        <div class="item">
          <div class="header">Setting</div>
          <div class="menu">
            <router-link to="/info/setting" class="item">setting</router-link>
          </div>
        </div>
      </div>
    </div>
    <div id="info-content">
      <router-view/>
    </div>
  </div>
</template>

<script>
export default {
}
</script>

<style lang="css">
#side-bar {
  margin-top: 62px;
  margin-bottom: 150px;
}
#info-content {
  margin-left: 225px;
  margin-right:20px;
}
</style>
