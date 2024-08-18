### Dessert Island

This is an implementation of the Fetch iOS take-home challenge to create a list of desserts and allow the user to browse each recipe.
All networking code is implemented using async/await.

TODOs:
+ Determine the best stateful way to handle SwiftUI. Having very little professional experience with it, I see tradeoffs between a Result<> based approach, a view-state approach, and a true view-model binding approach.
+ Error handling, especially for network requests. Currently, the app must be restarted if the original request fails. Likely, a *Retry* button or another option should be added to prevent the user from getting stuck.
+ Add view polish. There are some stateful animations that happen now, but the un-happy-path flow is not very polished.
+ Meal Detail view population: For some reason I don't understand yet, the Meal Detail page shows old meal details before loading in the new one. Likely this has something to do with the bindings but I just haven't figured it out yet. 
