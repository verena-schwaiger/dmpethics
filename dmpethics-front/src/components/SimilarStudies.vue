<template>
  <div class="answer-node-tree">
    <div v-show="!topicsexist">
      Please add some topics!
    </div>
    <div v-show="topicsexist">
      <div v-if="recommendations !== null && recommendations[0]">
        <div v-for="rec in recommendations" :key="rec">
          <div class="wikilink">
            <a :href="'http://localhost/smw/index.php/'+encodeURI(rec)">{{rec}}</a>
          </div>   
        </div>
      </div>
      <div v-else>
          You either haven't added keywords yet, or there are no studies with similar topics.
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: "similarstudies",
  props: {
    answerData: Object
  },
  data() {
    return{
      answers: this.answerData,
      recommendations: "",
      current: "x",
      topicsexist: true
    }
  },
  created () {
    axios
      .get('http://localhost:3000/answers/'+this.answers.id+'/', {id: this.answers.id})
      .then(response => {
        this.answers = response;
        this.recommendations = response.data.recommendations;
      })
  },
  methods: {
    getStudy(studyid){
      axios
      .get('http://localhost:3000/answers/'+studyid+'/', {id: studyid})
      .then(response => {
          this.current = response.data;
          this.topicsexist = true;
      })
      // eslint-disable-next-line
      .catch(error =>{
          this.topicsexist = false;
      })
    }      
  }
};
</script>