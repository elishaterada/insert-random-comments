InsertRandomComments = require '../lib/insert-random-comments'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "InsertRandomComments", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('insert-random-comments')

  describe "when the insert-random-comments:insert event is triggered", ->
    it "runs the event successfully", ->

      # This is an activation event, triggering it will cause the package to be
      # activated.
      result = atom.commands.dispatch workspaceElement, 'insert-random-comments:insert'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(result).toEqual(true)
