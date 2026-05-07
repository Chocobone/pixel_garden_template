document.addEventListener("DOMContentLoaded", () => {
  const balloon = document.createElement("div");
  balloon.className = "nes-balloon from-right copied-balloon";
  balloon.innerHTML = "<p>Copied!</p>";
  document.body.appendChild(balloon);

  function showCopiedBalloon(top, left) {
    balloon.style.display = "block";
    balloon.style.top = `${top - 60}px`;
    balloon.style.left = `${left - 100}px`;
    setTimeout(() => {
      balloon.style.display = "none";
    }, 1000);
  }

  document.querySelectorAll(".highlight").forEach((block) => {
    if (block.parentElement.closest(".highlight")) return;
    if (block.querySelector(".copy-code-button")) return;

    // Detect language from parent element's class (e.g. language-python)
    const parentClasses = block.parentElement.className || "";
    const langMatch = parentClasses.match(/language-(\w+)/);
    const language = langMatch ? langMatch[1] : "";

    // Outer nes-container wrapper
    const wrapper = document.createElement("div");
    wrapper.className = "nes-container code-block-container";

    // Top bar: traffic lights (left) + copy button (right)
    const topBar = document.createElement("div");
    topBar.className = "code-topbar";

    const lights = document.createElement("div");
    lights.className = "code-traffic-lights";
    lights.innerHTML =
      '<span class="traffic-light tl-red"></span>' +
      '<span class="traffic-light tl-yellow"></span>' +
      '<span class="traffic-light tl-green"></span>';

    const button = document.createElement("button");
    button.className = "nes-btn is-primary copy-code-button";
    button.type = "button";
    button.innerText = "Copy";

    button.addEventListener("click", (e) => {
      const code = block.querySelector("code").innerText;
      const textarea = document.createElement("textarea");
      textarea.value = code;
      document.body.appendChild(textarea);
      textarea.select();
      document.execCommand("copy");
      document.body.removeChild(textarea);
      showCopiedBalloon(e.pageY, e.pageX);
    });

    topBar.appendChild(lights);
    topBar.appendChild(button);

    // Language label below top bar
    const langLabel = document.createElement("div");
    langLabel.className = "code-language-label";
    langLabel.textContent = language;

    // Build structure: wrapper > topBar + langLabel + highlight block
    block.parentNode.insertBefore(wrapper, block);
    wrapper.appendChild(topBar);
    wrapper.appendChild(langLabel);
    wrapper.appendChild(block);
  });
});
