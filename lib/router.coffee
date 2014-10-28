Router.configure
  layoutTemplate: 'layout',
  loadingTemplate: 'loading',
  notFoundTemplate: 'notFound',
  waitOn: -> Meteor.subscribe 'posts'


Router.map ->
  this.route 'postsList',
    path: '/'
  this.route 'postPage',
    path: '/posts/:_id',
    data: -> Posts.findOne this.params._id

Router.onBeforeAction 'loading'
Router.onBeforeAction 'dataNotFound', only: 'postPage'
