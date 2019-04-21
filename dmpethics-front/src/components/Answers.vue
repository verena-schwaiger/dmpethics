<!-- Shows all studies from the database as an expandable list. -->
<template>
<div  class="container">
 <div id="answers">
    <div v-for="answer in answers" :key="answer.id">
      <div v-if="answer.study != ''" class="study">
        <div class="study-header">
          <a href="#" v-on:click="isSelected=answer.study; tabselect=1">{{ answer.study }}</a>
        </div>
        <div v-if="isSelected === answer.study" class="form-wiki-outer">
          <div class="tabs">
            <a v-on:click="tabselect=1" v-bind:class="[ tabselect === 1 ? 'active' : '' ]">Edit/Create Wiki page</a>
            <a v-on:click="tabselect=2" v-bind:class="[ tabselect === 2 ? 'active' : '' ]">Checklist</a>
            <a v-on:click="tabselect=3" v-bind:class="[ tabselect === 3 ? 'active' : '' ]">Update/Review Questionnaire</a>
          </div>
          <div class="form-wiki">
            <div v-if="tabselect === 1">
              <answer-tree :answer-data="answer" :detail-data="details"></answer-tree>
            </div>
            <div v-if="tabselect === 2">
              <checklist-tree :answer-data="answer"></checklist-tree>
            </div>
            <div v-if="tabselect === 3">
              <questionnaire-edit :answer-data="answer"></questionnaire-edit>
            </div>
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
import ChecklistTree from "./ChecklistTree.vue"
import QuestionnaireEdit from "./QuestionnaireEdit.vue"

export default {
 data() {
  return {
   answers: [],
   details: [],
   isSelected: false,
   errors: [],
   tabselect: 1
  }
 },
   computed:{
    dataToJSON (a){
        return JSON.parse(a)
    }
  },
  created () {
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
      AnswerTree,
      ChecklistTree,
      QuestionnaireEdit
    },
  methods: {

  }
}
</script>