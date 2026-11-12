<%
// Custom listing template for the project list.
//
// Renders projects as a plain, single-column list (title, keyword-tag
// badges, date range, description); no card chrome, no thumbnails. Order
// comes from projects/index.yml, not from sorting metadata.
//
// When a project has its own page on this site (the default), the title
// itself and a chain icon after it both link there. Set `no-page-link:
// true` on a project to skip this (e.g. when there's nothing on the page
// worth a separate visit): in that case, set `paper:` on the project so a
// paper icon still gives visitors somewhere to go. A further icon links
// out to the project's external homepage if it has one, otherwise to its
// GitHub repo if that's all it has.
%>

```{=html}
<div class="project-list">
<% for (const item of items) { %>
  <div class="project-item">
    <div class="project-item-head">
      <% if (!item['no-page-link']) { %>
      <a href="<%- item.path %>" class="project-item-title-link"><span class="project-item-title"><%= item.title %></span></a>
      <a href="<%- item.path %>" class="project-item-icon" title="Project page"><i class="bi bi-link-45deg"></i></a>
      <% } else { %>
      <span class="project-item-title"><%= item.title %></span>
      <% } %>
      <% if (item.paper) { %>
      <a href="<%- item.paper %>" class="project-item-icon" title="Paper" target="_blank" rel="noopener"><i class="bi bi-file-earmark-pdf"></i></a>
      <% } %>
      <% if (item.homepage) { %>
      <a href="<%- item.homepage %>" class="project-item-icon" title="Project website" target="_blank" rel="noopener"><i class="bi bi-box-arrow-up-right"></i></a>
      <% } else if (item.github) { %>
      <a href="<%- item.github %>" class="project-item-icon" title="GitHub repository" target="_blank" rel="noopener"><i class="bi bi-github"></i></a>
      <% } %>
    </div>
    <div class="project-item-meta">
      <% if (item.categories) { %>
      <div class="listing-categories">
        <% for (const category of item.categories) { %>
        <div class="listing-category cat-<%= category.toLowerCase().replace(/[^a-z0-9]+/g, '-') %>"><%= category %></div>
        <% } %>
      </div>
      <% } %>
      <% if (item['start-date']) { %>
      <span class="project-item-dates"><%= item['start-date'] %><% if (item['end-date']) { %> – <%= item['end-date'] %><% } %></span>
      <% } %>
    </div>
    <div class="project-item-desc"><%= item.description %></div>
  </div>
<% } %>
</div>
```
