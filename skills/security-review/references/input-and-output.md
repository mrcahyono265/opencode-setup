# Input, Output & Injection Review

Use this reference when the task handles external input, dynamic queries, HTML, shell commands, files, URLs, templates, or serialized data.

## Check

- Validate input at the appropriate trust boundary.
- Use parameterized queries or framework-safe query APIs.
- Avoid constructing shell commands from untrusted input.
- Escape or sanitize output according to its rendering context.
- Treat uploaded files, URLs, and imported data as untrusted.
- Avoid unsafe deserialization or dynamic code execution.
- Validate redirects and external resource destinations when relevant.

## Evidence

Trace the input from entry point to sink. Do not report a generic vulnerability merely because a dangerous API exists; establish whether attacker-controlled data can reach it unsafely.
