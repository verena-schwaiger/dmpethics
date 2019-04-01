
<!-- Navigation bar -->
<template>
  <div class="nav">
    <nav>
        <router-link class="navlink" v-for="link in pages" v-bind:key="link.id" :to="`${link.route}`">{{link.text}}</router-link>

    </nav>
  </div>
</template>
<script>
export default {
  name: 'Navigation',
  data() {
    return {
      pages: [
        {
          id: 0,
          text: 'Home',
          route:'/'
        },
        /*{
          id: 1,
          text: 'User',
          route:'/user'
        },*/
        {
          id: 2,
          text: 'Studies',
          route:'/answers'
        },
        {
            id: 3,
            text: 'Add Study',
            route: '/questionnaire'
        }
      ]
    }
  }
}
</script>