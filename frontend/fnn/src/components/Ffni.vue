<template>
  <div class="page-header">
      <div class="page-header-image"></div>
      <div class="content">
        <div class="container">
            <div class="col-md-10 ml-auto col-xl-10 mr-auto">
                <div class="card">
                    <div class="card-header">
                        {{ffni.topic}}
                    </div>
                    <div class="card-body"  style="display: grid; grid-template-columns: 80% 20%; grid-template-rows: auto; grid-template-areas: 'content percent';">
                        <div style="grid-area: content">
                            <div>
                            {{ffni.content}}
                            </div>
                            <div>
                                <a @click="upvote()" href="#" style="margin-right: 20px; color: #28a745"><i class="tim-icons icon-check-2" style="font-size: 24px;"></i> {{ffni.upvotes}}</a>
                                <a @click="downvote()" href="#" style="margin-right: 40px; color: #ffc107"><i class="tim-icons icon-simple-remove" style="font-size: 24px;"></i> {{ffni.downvotes}}</a>
                                <a href="#" style="color: #95cbcf"><u>{{ffni.user_id}}</u></a>
                            </div>
                        </div>
                        <div class="nav nav-pills nav-pills-danger nav-pills-icons">
                            <li class="nav-item">
                                <a class="nav-link active show" data-toggle="tab" href="#">
                                <i class="tim-icons icon-atom"></i> {{ ((Number(ffni.upvotes)/(Number(ffni.downvotes)+Number(ffni.upvotes)))*100).toFixed(2) }}%
                                </a>
                            </li>
                        </div>
                    </div>
                </div>
                <u>Comments</u>
                <div class="card" style="margin-top: 10px;">
                    <div class="card-header">
                        Comment on this content
                    </div>
                    <div class="card-body">
                        <form class="form" @submit.prevent="addComment">
                            <div class="input-group">
                                <input v-model="topic" type="text" class="form-control" placeholder="Write your topic here...">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="tim-icons icon-lock-circle"></i></span>
                                </div>
                            </div>
                            <div class="input-group">
                                <input v-model="content" type="text" class="form-control" placeholder="Write your comment here...">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="tim-icons icon-lock-circle"></i></span>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Send comment</button>
                        </form>
                    </div>
                </div>
                <div v-for="comment in comments" :key="comment.id" :comment="comment">
                    <div class="card">
                        <div class="card-header">
                            {{ comment.topic }}
                        </div>
                        <div class="card-body"  style="display: flex;">
                            <div style="display: grid; grid-gap: 20px;">
                                <div>
                                {{ comment.content }}
                                </div>
                                <div>
                                    <a href="#" style="color: #95cbcf"><u>{{ comment.user_id }}</u></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
</template>

<script>
export default {
  name: 'Ffni',
  data () {
    return {
      ffni: JSON.parse(localStorage.getItem('ffni')),
      comments: '',
      topic: '',
      content: '',
      error: ''
    }
  },
  created () {
    this.$http.axios.get('/comments/' + this.ffni.id + '')
      .then(response => { this.comments = response.data })
      .catch(error => this.setError(error, 'Something went wrong'))
  },
  methods: {
    addComment () {
      this.$http.axios.post('/comments', { topic: this.topic, content: this.content, ffni_id: this.ffni.id })
        .then(response => window.location.reload(true))
    },
    upvote () {
      this.$http.axios.put('/ffnis/' + this.ffni.id + '', { upvotes: parseInt(this.ffni.upvotes) + 1 })
        .then(response => {
          localStorage.ffni = JSON.stringify(response.data)
          this.$router.replace('/ffni')
          window.location.reload(true)
        })
    },
    downvote () {
      this.$http.axios.put('/ffnis/' + this.ffni.id + '', { downvotes: parseInt(this.ffni.downvotes) + 1 })
        .then(response => {
          localStorage.ffni = JSON.stringify(response.data)
          this.$router.replace('/ffni')
          window.location.reload(true)
        })
    }
  }
}
</script>

<style lang="css">
</style>
