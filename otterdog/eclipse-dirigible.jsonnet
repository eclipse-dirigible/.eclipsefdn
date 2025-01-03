local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('ecd.dirigible', 'eclipse-dirigible') {
  settings+: {
    description: "",
    name: "Eclipse Dirigible™",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('dirigible') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Eclipse Dirigible™ Project",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://www.dirigible.io",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('DOCKER_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKER_USER') {
          value: "********",
        },
        orgs.newRepoSecret('GH_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('GH_USER_EMAIL') {
          value: "********",
        },
        orgs.newRepoSecret('GH_USER_NAME') {
          value: "********",
        },
        orgs.newRepoSecret('MAVEN_GPG_PASS_PHRASE') {
          value: "********",
        },
        orgs.newRepoSecret('MAVEN_GPG_PRIVATE_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('MAVEN_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('MAVEN_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/ecd.dirigible/sonarcloud.io/token",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('dirigible-samples') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}