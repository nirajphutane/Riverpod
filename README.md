# Riverpod


💡 Modifiers:

1. Non-disposable, Non-family:
   Created once, shared across all widgets / Application level Singleton
   Doesn't die unless app dies.
   ✅ Singleton

2. Non-disposable, Family:
   Param → instance map.
   Each param creates one unique instance (cached).
   ✅ Factory with memoization / const or data class
   ❗ Same param → same instance → shared across app
   ❗ Different param → Different instance → unique across app

3. AutoDispose, Non-family:
   Acts like a Singleton / Scoped Singleton but is short-lived (disposed when not watched).
   ✅ Scoped (page/screen level) Singleton

4. AutoDispose, Family:
   Combines param-based factory with auto-dispose behavior.
   ✅ Scoped Factory (param → instance, disposed when not used)

---

🎯 Summary Table
Riverpod Provider	    Singleton?  Param-based?	Disposable? 	    Analogy
Provider (non-family)	    ✅	        ❌	            ❌ (permanent)	App-level Singleton
Provider.family	            ❌	        ✅	            ❌ (cached)	    App-level Factory (cached)
Provider.autoDispose	    ✅	        ❌	            ✅	            Scoped Singleton
Provider.autoDispose.family	❌	        ✅	            ✅	            Scoped Factory

---

Without .family → Singleton: One instance across the app.
With .family → Factory: Creates a new instance for each unique parameter.

---

🎯 Mapping:

| Concept                   | Riverpod Term                 | Android/Java Equivalent                          |
|---------------------------|-------------------------------|--------------------------------------------------|
| `family`                  | `Provider.family(...)`        | `new MyObject(args)` – factory per parameter     |
| Singleton (global)        | `StateProvider`, etc.         | `static final MyObject = ...`                   |
| Scoped singleton (UI)     | `autoDispose`                 | Tied to Activity/Fragment lifecycle              |
| Manual reset              | `ref.invalidate()`            | `instance = null;` or `reset()`                  |
| Prevent auto-dispose      | `ref.keepAlive()`             | `setRetainInstance(true)` / scoped retention     |

---

invalidate() → dispose only, lazy recreate when next read.
refresh() → dispose and immediate recreate.

ref.invalidate() = dispose / re-initialize state
ref.refresh() = ref.invalidate() + watch/read

---

🚀 TL;DR
> **`family` is like `new` in Java (factory).**  
> **Non-family is like a singleton (global unless autoDispose).**  
> **`autoDispose` is like Fragment-level object that dies with the screen.**  
> **`ref.invalidate()` is like manual `reset()` or `nullify`.**
