<!-- Shows all studies from the database as an expandable list. -->
<template>
<div  class="container">
  <div id="answers">
    <div v-for="answer in answers" :key="answer.id">
      <div v-if="answer.study != '' && deleted !== answer.id" class="study">
        <div class="study-header">
          <a href="#" v-on:click="isSelected=answer.id; tabselect=1">{{ answer.study }}</a>
        </div>
        <div v-if="isSelected === answer.id" class="form-wiki-outer">
          <div class="tabs">
            <a v-on:click="tabselect=1; reloadData()" v-bind:class="[ tabselect === 1 ? 'active' : '' ]">Edit/Create Wiki page</a>
            <a v-on:click="tabselect=2; reloadData()" v-bind:class="[ tabselect === 2 ? 'active' : '' ]">Checklist</a>
            <a v-on:click="tabselect=3; reloadData()" v-bind:class="[ tabselect === 3 ? 'active' : '' ]">Update/Review Questionnaire</a>
            <a v-on:click="tabselect=4; reloadData()" v-bind:class="[ tabselect === 4 ? 'active' : '' ]">Similar Studies</a>

          </div>
          <div class="form-wiki">
            <div v-if="tabselect === 1">
              <answer-tree :answer-data="answer" :detail-data="details" v-on:update-answer="reloadData"></answer-tree>
            </div>
            <div v-if="tabselect === 2">
              <checklist-tree :answer-data="answer"></checklist-tree>
            </div>
            <div v-if="tabselect === 3">
              <questionnaire-edit :answer-data="answer"></questionnaire-edit>
            </div>
            <div v-if="tabselect === 4">
              <similar-studies :answer-data="answer"></similar-studies>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-show="loading">
      <img src="@/assets/loading.gif" width="70px" height="35px">
    </div> 
  </div>
</div>
</template>

<script>
import axios from 'axios'
import AnswerTree from "./AnswerTree.vue"
import ChecklistTree from "./ChecklistTree.vue"
import QuestionnaireEdit from "./QuestionnaireEdit.vue"
import SimilarStudies from "./SimilarStudies.vue"

export default {
 data() {
  return {
   answers: [],
   details: [],
   active: false,
   isSelected: "",
   loading: false,
   errors: [],
   deleted: "",
   tabselect: 1
  }
 },
   computed:{
    dataToJSON (a){
      return JSON.parse(a)
    }
  },
  created () {
    this.loading = true;
    axios
      .get('http://localhost:3000/answers/')
      .then(response => {
        this.answers = response.data;
        this.loading = false;
      })
  },
  components: {
    AnswerTree,
    ChecklistTree,
    QuestionnaireEdit,
    SimilarStudies
    },
  methods: {
    reloadData(e){       
      this.deleted = e;
      axios
        .get('http://localhost:3000/answers/')
        .then(response => {
          this.answers = response.data;
        })
    }
  }
}
</script>