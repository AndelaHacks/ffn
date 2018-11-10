<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <h2>ABOUT</h2>
    <p>FFN
    Fighting Fake News web enables verification and validation of the news by crowdsourcing varies users. The platform enables engaging on the topic searched by commenting and voting on it as either valid or fake.
    For more info contact:
    Phone No: 2345666
    Email: ffn@google.com</p>
    <router-link to="/login">Have an account? Go to login.</router-link>
    <br>
    <router-link to="/register">Have no account? Go to register.</router-link>
    <br>
    <router-link to="/ffnis">Top searches.</router-link>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to FFN'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
