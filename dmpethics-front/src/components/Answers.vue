<!-- Shows all studies from the database as an expandable list. -->
<template>
<div  class="container">
 <div id="answers">
    <div v-for="answer in answers" :key="answer.id">
      <div v-if="answer.study != ''" class="study">
        <div class="study-header">
          <a href="#" @click="isSelected=answer.study">{{ answer.study }}</a>
        </div>
        <div v-if="isSelected === answer.study" class="form-wiki-outer">
          <div class="form-wiki">
            <answer-tree :answer-data="answer" :detail-data="details"></answer-tree>
          </div>
        </div>
      </div>
    </div>

</div>
 </div>
</template>

<script>
import axios from 'axios'
import AnswerTree from "./AnswerTree.vue"

export default {
 data() {
  return {
   answers: [],
   details: [],
   isSelected: false,
   errors: []
  }
 },

  mounted () {
    axios
      .get('http://localhost:3000/answers/')
      .then(response => {
        this.answers = response.data;
        return axios.get('http://localhost:3000/study_details/');
      })
      .then(response =>{
        this.details = response;
      })
  },
  components: {
      AnswerTree
    },
  methods: {

  }
}
</script>