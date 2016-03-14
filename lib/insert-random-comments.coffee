CSON = require 'season'
path = require 'path'

{CompositeDisposable} = require 'atom'

module.exports = InsertRandomComments =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'insert-random-comments:insert': => @insert()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  insert: ->

    if editor = atom.workspace.getActiveTextEditor()

      # Load all random comments
      packagePath = atom.packages.getLoadedPackage('insert-random-comments').path
      dataPath = path.join( packagePath + '/data/random-comments.cson' )

      comments = CSON.readFileSync( dataPath )
      commentsCount = comments.length

      # Grab a random comment
      commentsIndex = Math.floor( Math.random() * commentsCount )

      # Insert a random comment
      editor.insertText( comments[commentsIndex] + '\n\n' )
