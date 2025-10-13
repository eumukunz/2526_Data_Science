# 🧩 Forking and Maintaining a Public GitHub Repository (MIT Licensed)

This guide explains how to **clone, modify, and maintain** a public GitHub repository under the **MIT License** while keeping your own version in sync with the original.

---

## ⚖️ 1. License Overview

The **MIT License** allows you to:

- ✅ **Copy** the original code and content.
- ✅ **Modify** and republish it (privately or publicly).
- ✅ **Use** it for any purpose, including commercial.
- ❗ **Requirement:** Keep the original license file and copyright notice.

You must:
- Keep the original `LICENSE` file unchanged.
- Attribute the original source in your `README.md`.

**Example attribution:**

> This repository is based on [original-repo](https://github.com/original-author/original-repo) by [Original Author], licensed under the MIT License.  
> Modified by [Your Name] for educational and demonstration purposes.

---

## 🔧 2. Forking the Repository

Forking is the easiest and most flexible way to maintain your own version while staying connected to the original project.

### Steps:
1. Go to the original GitHub repository (with MIT License).
2. Click **Fork** (top-right corner).
3. Choose your GitHub account and repository name.
4. GitHub creates your own copy, e.g.:

   ```
   https://github.com/your-username/original-repo
   ```

---

## 💻 3. Clone Your Fork Locally

```bash
git clone https://github.com/your-username/original-repo.git
cd original-repo
```

Now you have a local copy of your forked repository.

---

## 🔗 4. Add the Original Repository as an Upstream Remote

This lets you pull future updates from the source repo.

```bash
git remote add upstream https://github.com/original-author/original-repo.git
```

Check that your remotes are set up correctly:

```bash
git remote -v
```

Expected output:

```
origin    https://github.com/your-username/original-repo.git (fetch)
upstream  https://github.com/original-author/original-repo.git (fetch)
```

---

## ✏️ 5. Modify and Commit Changes

You can now modify the notebooks or any files freely.

```bash
# Edit files
git add .
git commit -m "Edited notebooks and added new examples"
git push
```

Your changes are pushed to your **own GitHub fork**.

---

## 🔄 6. Keeping Your Fork Updated

To pull new changes from the original repository:

```bash
# Fetch updates from the upstream repo
git fetch upstream

# Merge them into your main branch
git checkout main
git merge upstream/main

# Push to your fork
git push origin main
```

If you work on a separate branch for your edits:

```bash
git checkout my-edits
git rebase main
```

---

## 🌿 7. Recommended Branch Workflow

- Keep your `main` branch in sync with upstream’s `main`.
- Create a branch like `my-edits` for your custom changes.

```bash
git checkout -b my-edits
# make edits
git add .
git commit -m "Custom notebook modifications"
git push -u origin my-edits
```

To update later:

```bash
git checkout main
git fetch upstream
git merge upstream/main
git push origin main
git checkout my-edits
git rebase main
```

---

## 🧠 8. Good Practices

- Keep the `LICENSE` file untouched.
- Add attribution in your `README.md`.
- Use `.gitignore` to avoid committing large data files.
- Optionally, clean Jupyter notebook outputs before committing:

  ```bash
  pip install nbstripout
  nbstripout --install
  ```

- Use `requirements.txt` or `environment.yml` to list dependencies.

---

## ✅ 9. Summary

| Goal | Action |
|------|---------|
| Modify and publish your own version | Fork the repo |
| Stay up-to-date with the original | Add `upstream` remote |
| Track your edits separately | Create a new branch |
| Maintain license compliance | Keep `LICENSE` and attribution |

---

## 📜 Example Attribution (README snippet)

```markdown
### Credits
This repository is a modified fork of [original-repo](https://github.com/original-author/original-repo)  
by [Original Author], distributed under the MIT License.  
Modifications include updated notebooks and additional examples.
```

---

### 🏁 You’re Done!

You now have your own **public version** of the project — with full version control, freedom to modify, and a link back to the original author under the MIT License.

---
