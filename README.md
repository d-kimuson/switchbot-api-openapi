# switchbot-api-openapi

A project to write OpenAPI Schema from [Switchbot API documentation](https://github.com/OpenWonderLabs/SwitchBotAPI/blob/main/README.md).

Since OpenAPI Schema is not officially provided, This project provide an unofficial schema created from the documentation.

Some parts of the schema are written using LLM, so quality cannot be guaranteed. (Contributions are welcome.)

## Using OpenAPI Spec

You can download and use the OpenAPI Spec with the following command.

```bash
$ curl 'https://raw.githubusercontent.com/d-kimuson/switchbot-api-openapi/main/dist/%40typespec/openapi3/openapi.yaml' > ./switchbot-openapi.yaml
```

## Purpose

The main goal of this project is to provide machine-readable documentation. With schemas written in OpenAPI, you can use excellent code generation tools like OpenAPI Generator to make API calls productively.
By cloning the repository, you can view the redoc-based API documentation. While it's structured and may be helpful, our primary objective is to define machine-readable schemas, not to prioritize human readability.

## Scope of Support

This project supports Switchbot API v1.1 endpoints.
However, since the TypeSpec we're using doesn't support OpenAPI webhooks, the schemas for incoming webhook requests are not defined.

## Contribute

Welcome!

Some parts of source code is written out using LLM and is not accurate.

In addition, the API definitions may contain errors as they are based on our interpretation of the documentation rather than exhaustive testing.
Additionally, since we cannot generate these automatically, there's a possibility that our definitions may not reflect the latest updates to the official Switchbot documentation.

If you find any discrepancies between our definitions and the actual API behavior, we welcome your contributions.

### Structure

Schemas are written by [TypeSpec](https://typespec.io/).

When you edit it, you need to modify the source code and build schema.

### setup repository

```bash
$ pnpm i
```

### start up development server

```bash
$ pnpm dev
```

The development watcher will be started.
You can preview the documentation at http://localhost:8080.

### build

```bash
$ pnpm build
```

## lint

Lint the OAS built by TypeSpec.

```bash $ pnpm build
$ pnpm lint
```
