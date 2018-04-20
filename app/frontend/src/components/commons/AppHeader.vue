<template lang="html">
  <div id="header">
      <div class="ui fixed inverted secondary pointing menu" id="menu-container">
        <router-link to="/"><p id="logo" @click="activeClicked">I E F</p></router-link>
        <div class="right menu" @click="activeClicked">
          <router-link to="/" class="item" :class="{'active': isClicked('About')}">About</router-link>
          <router-link to="/blog" class="item" :class="{'active': isClicked('Blog')}">Blog</router-link>
          <router-link to="/investing/performance" class="item" :class="{'active': isClicked('Investing')}">Investing</router-link>
          <router-link to="/login" class="item" :class="{'active': isClicked('Login')}">Login</router-link>
        </div>
      </div>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      checked: ''
    }
  },
  methods: {
    activeClicked: function (event) {
      this.checked = event.target.innerHTML
      window.scrollTo(0, 0)
    },
    isClicked: function (str) {
      return this.checked === str
    }
  }
}
</script>

<style lang="css">
#logo {
  font-size: 27px;
  color: #ffffff;
  font-family: 'Gugi', cursive !important;
}

#menu-container {
  background-color: #212121;
  padding: 10px;
  padding-left: 30px;
  padding-right: 30px;
}
</style>
